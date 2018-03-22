json.vendor do
  json.(@vendor, :id, :name, :description, :longitude, :latitude, :place_id, :address, :description, :logo_url)
end
json.items do
  json.array! @items, partial: 'items/item', as: :item
end
