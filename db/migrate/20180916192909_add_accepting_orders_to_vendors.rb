class AddAcceptingOrdersToVendors < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :accepting_orders, :boolean, default: false
  end
end
