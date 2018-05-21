class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :orders, class_name: "UserOrder"
  has_many :vendor_orders, through: :orders
  has_many :user_blocked_vendors
  has_many :blocked_vendors, through: :user_blocked_vendors, source: 'vendor'

  def name
    email
  end
end
