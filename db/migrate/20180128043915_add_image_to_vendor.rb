class AddImageToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :image_src, :string
  end
end
