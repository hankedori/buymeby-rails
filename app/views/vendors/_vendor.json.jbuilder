json.(vendor, :id, :name, :description, :longitude, :latitude, :image_src, :logo_url, :accepting_orders)
json.hours do
  json.array! vendor.operational_hours, partial: 'operational_hours/operational_hour', as: :day
end
