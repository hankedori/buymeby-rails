class Vendor < ApplicationRecord
  enum status: [ :inactive, :active ]

  has_many :items
  has_many :operational_hours, class_name: 'OperationalHours'
  has_many :orders, class_name: 'VendorOrder'

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User


  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""

  validates_attachment :logo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..5.megabytes }

  def logo_url
    logo.url
  end

  def setup_complete
    description.present? &&
    operational_hours.any? &&
    place_id.present? &&
    latitude.present? &&
    longitude.present? &&
    address.present? &&
    logo_url.present?
  end

  def update_hours(days)
    days.each do |day|
      hour = operational_hours.find_or_create_by!(day: day.day)
      hour.open_time = day.open_time
      hour.close_time = day.close_time
      hour.open = day.open
      hour.save!
    end

    true
  end

  def token_validation_response
    self.as_json(include: [:operational_hours]).merge(logo_url: logo_url, setup_complete: setup_complete)
  end

  def send_push_notif!(message, data = {})
    if device_token.present?
      n = Rpush::Apns::Notification.new
      n.app = Rpush::Apns::App.find_by_name("Sellmeby")
      n.device_token = device_token
      n.alert = message
      n.data = data
      n.save!
    end
  end
end
