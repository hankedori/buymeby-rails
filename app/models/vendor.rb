class Vendor < ApplicationRecord
  has_many :items
  has_many :operational_hours, class_name: 'OperationalHours'

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User


  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment :logo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..5.megabytes }

  def logo_url
    logo.url
  end

  def update_hours(days)
    days.each do |day|
      hour = operational_hours.find_or_create_by!(day: day.day)
      hour.open = day.open
      hour.close = day.close
      hour.save!
    end

    true
  end
end
