class Item < ApplicationRecord
  belongs_to :vendor
  has_many :discounts

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

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
