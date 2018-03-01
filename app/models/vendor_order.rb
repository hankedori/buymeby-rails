class VendorOrder < ApplicationRecord
  belongs_to :vendor
  has_many :order_details
end
