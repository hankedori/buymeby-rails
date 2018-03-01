class Item < ApplicationRecord
  belongs_to :vendor
  has_many :discounts

  def most_recent_discount
    0.0
  end
end
