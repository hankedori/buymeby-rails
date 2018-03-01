class UserOrder < ApplicationRecord
  belongs_to :user
  has_many :vendor_orders
  has_many :order_details
end
