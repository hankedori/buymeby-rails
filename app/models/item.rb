class Item < ApplicationRecord
  belongs_to :vendor
  has_many :discounts

  scope :in_stock, -> { where("quantity > ?", 0) }

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates :quantity,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_attachment :image,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..5.megabytes }

  def most_recent_discount
    0.0
  end

  def image_file_src
    if image.present?
      image.url
    else
      image_src
    end
  end
end
