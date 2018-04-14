class AddVendorOrderCompletedAt < ActiveRecord::Migration[5.1]
  def change
    add_column :vendor_orders, :completed_at, :datetime
  end
end
