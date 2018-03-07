class VendorS3Logo < ActiveRecord::Migration[5.1]
  def up
    add_attachment :vendors, :logo
  end

  def down
    remove_attachment :vendors, :logo
  end
end
