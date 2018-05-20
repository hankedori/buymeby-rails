class CartController < ApplicationController
  before_action :authenticate_member!

  def populate
    @populated_cart = cart_params.to_h.reduce([]) do |populated_cart, (vendor_id, items)|
      vendor = Vendor.find(vendor_id)
      vendor_hash = vendor.serializable_hash
      vendor_hash["items"] = items.reduce([]) do |item_array, (item_id, quantity)|
        item = vendor.items.find(item_id).as_json(methods: :image_file_src)
        item['total'] = '%.2f' % (quantity * item['price'])
        item_array.push(item)
      end
      vendor_hash["total"] = '%.2f' % (vendor_hash["items"].sum { |i| i['total'].to_f })
      # vendor_hash["items"] = Item.find(items.keys).as_json(methods: :image_file_src)
      populated_cart.push(vendor_hash)
    end
  end

  def order
    @user_order_creation = UserOrderCreation.from_cart_params!(current_user, cart_params)
    if @user_order_creation.save
      render :order, status: :created
    else
      render json: @user_order_creation.errors, status: :unprocessable_entity
    end
  end

  def cart_params
    params.require(:cart).permit!
  end
end
