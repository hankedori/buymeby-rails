class Vendor < ApplicationRecord
  has_many :items
  has_many :operational_hours, class_name: 'OperationalHours'

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment :logo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..5.megabytes }
end
