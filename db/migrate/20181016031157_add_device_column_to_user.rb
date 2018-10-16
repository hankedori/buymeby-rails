class AddDeviceColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :device_os, :string
    add_column :vendors, :device_os, :string
  end
end
