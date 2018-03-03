class OrderDetail < ApplicationRecord
  belongs_to :user_order
  belongs_to :vendor_order
  belongs_to :item

  def total_cost
    @total_cost ||= price * quantity
  end
end
