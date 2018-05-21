class VendorOrder < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :vendor
  belongs_to :user_order

  has_many :order_details

  delegate :user, to: :user_order
  delegate :name, to: :user
  delegate :name, to: :vendor, prefix: true

  scope :completed, -> { where(status: 'COMPLETE') }
  scope :reserved, -> { where(status: 'RESERVED') }
  scope :cancelled, -> { where(status: 'CANCELLED') }

  def complete!
    update! status: 'COMPLETE', completed_at: Time.now
  end

  def cancel!
    transaction do
      order_details.each do |detail|
        detail.item.update!(quantity: detail.item.quantity + detail.quantity)
      end
      update! status: 'CANCELLED'
    end
  end

  def total_amount
    @total_amount ||= order_details.sum(&:total_cost)
  end

  def created_description
    completed? ? "completed " +  time_ago_in_words(completed_at) + " ago" : "placed " + time_ago_in_words(created_at) + " ago"
  end

  def total_description
    @total_description ||= "$" + total_amount.to_s
  end

  def image_src
    @image_src ||= order_details.first.image_file_src if order_details.present?
  end

  def completed?
    status == 'COMPLETE'
  end
end
