class VendorOrder < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :vendor
  belongs_to :user_order

  has_many :order_details

  delegate :user, to: :user_order
  delegate :name, to: :user

  def complete!
    update! status: 'COMPLETE', completed_at: Time.now
  end

  def total_amount
    @total_amount ||= order_details.sum(&:total_cost)
  end

  def created_description
    @created_description ||= "placed " + time_ago_in_words(created_at) + " ago"
  end

  def total_description
    @total_description ||= "$" + total_amount.to_s
  end

  def image_src
    @image_src ||= order_details.first.image_file_src if order_details.present?
  end
end
