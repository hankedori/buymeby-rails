class AddInactiveVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :status, :integer, default: 0
  end
end
