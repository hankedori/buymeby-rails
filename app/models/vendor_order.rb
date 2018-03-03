class VendorOrder < ApplicationRecord
  belongs_to :vendor
  has_many :order_details

  def total_amount
    @total_amount ||= order_details.sum(&:total_cost)
  end
end
