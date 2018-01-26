json.partial! "vendors/vendor", vendor: @vendor
json.items do
  json.array! @vendor.items, partial: 'items/item', as: :item
end
