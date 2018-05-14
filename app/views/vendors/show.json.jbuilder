json.(@vendor, :id, :name, :description, :longitude, :latitude, :place_id, :address, :description, :image_src, :logo_url)
json.items do
  json.array! @vendor.items.in_stock, partial: 'items/item', as: :item
end
json.hours do
  json.array! @vendor.operational_hours, partial: 'operational_hours/operational_hour', as: :day
end
