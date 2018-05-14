class OrderDetail < ApplicationRecord
  belongs_to :user_order
  belongs_to :vendor_order
  belongs_to :item

  delegate :image_file_src, :name, to: :item

  before_save do
    item.update(quantity: item.quantity - quantity)
  end

  def total_cost
    @total_cost ||= price * quantity
  end
end
