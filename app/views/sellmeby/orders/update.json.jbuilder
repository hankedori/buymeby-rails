json.orders @orders do |order|
  json.extract! order, :id, :name, :created_description, :total_description, :image_src, :status, :completed_at
  json.order_details do
    json.array! order.order_details do |order_detail|
      json.extract! order_detail, :id, :name, :image_file_src, :price, :quantity, :discount, :total_cost
    end
  end
end
json.completed_orders @completed_orders do |order|
  json.extract! order, :id, :name, :created_description, :total_description, :image_src, :status, :completed_at
  json.order_details do
    json.array! order.order_details do |order_detail|
      json.extract! order_detail, :id, :name, :image_file_src, :price, :quantity, :discount, :total_cost
    end
  end
end
