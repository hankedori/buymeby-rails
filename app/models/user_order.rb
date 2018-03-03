class UserOrder < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :user
  has_many :vendor_orders
  has_many :order_details
  has_many :vendors, through: :vendor_orders

  def name
    @name ||= vendors.map(&:name).join(", ")
  end

  def created_description
    @created_description ||= "placed " + time_ago_in_words(created_at) + " ago"
  end

  def total_description
    @total_description ||= "$" + total_amount.to_s + ", " + vendor_count.to_s + " vendor(s)"
  end

  def vendor_count
    @vendor_count ||= vendor_orders.count
  end

  def total_amount
    @total_amount ||= vendor_orders.sum(&:total_amount)
  end

  def image_src
    @image_src ||= vendors.first.image_src if vendors.present?
  end
end
