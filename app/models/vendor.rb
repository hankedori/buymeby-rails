class Vendor < ApplicationRecord
  has_many :items
  has_many :operational_hours, class_name: 'OperationalHours'
end
