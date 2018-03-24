class UpdateOperationalHoursColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :operational_hours, :open, :open_time
    rename_column :operational_hours, :close, :close_time
    add_column :operational_hours, :open, :boolean, :default => false
  end
end
