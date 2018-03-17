class AddDayNullableTimeToHours < ActiveRecord::Migration[5.1]
  def change
    add_column :operational_hours, :day, :string
    change_column :operational_hours, :open, :time, :null => true
    change_column :operational_hours, :close, :time, :null => true
  end
end
