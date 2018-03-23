json.vendor do
  json.(current_vendor, :id, :name, :description, :longitude, :latitude, :place_id, :address, :description, :logo_url)
end
json.items do
  json.array! current_vendor.items, partial: 'items/item', as: :item
end
json.hours do
  json.array! current_vendor.operational_hours, partial: 'operational_hours', as: :day
end
