class Item < ApplicationRecord
  belongs_to :retailer
  has_many :discounts
end
