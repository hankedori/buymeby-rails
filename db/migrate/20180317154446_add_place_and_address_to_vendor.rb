class AddPlaceAndAddressToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :place_id, :string
    add_column :vendors, :address, :string
  end
end
