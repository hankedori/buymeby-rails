class OrderDetail < ApplicationRecord
  belongs_to :user_order
  belongs_to :vendor_order
  belongs_to :item
end
