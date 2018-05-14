class UserOrderCreation
  include ActiveModel::Model

  INITIAL_STATUS = 'RESERVED'

  attr_accessor :user, :user_order

  def self.from_cart_params!(user, cart_params)
    user_order = UserOrder.new(user: user, status: INITIAL_STATUS)
    vendor_orders = cart_params.to_h.reduce([]) do |populated_cart, (vendor_id, item_quantities)|
      vendor = Vendor.find(vendor_id)
      vendor_order = user_order.vendor_orders.new(vendor: vendor, status: INITIAL_STATUS)
      item_quantities.keys.each do |item_id|
        item = Item.find(item_id)
        user_order.order_details.new(
          vendor_order: vendor_order,
          item: item,
          price: item.price,
          discount: item.most_recent_discount,
          quantity: item_quantities[item_id]
        )
      end
    end

    self.new(user: user, user_order: user_order)
  end

  def save
    valid? && user_order.save
  end
end
