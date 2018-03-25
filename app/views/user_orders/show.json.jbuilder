json.extract! @order, :id, :name, :created_description, :total_description, :image_src
json.set! :vendor_orders do
  json.array! @order.vendor_orders do |vendor_order|
    json.extract! vendor_order, :id, :name, :status, :total_amount
    json.set! :order_details do
      json.array! vendor_order.order_details do |order_detail|
        json.extract! order_detail, :id, :name, :image_file_src, :price, :quantity, :discount, :total_cost
      end
    end
  end
end
