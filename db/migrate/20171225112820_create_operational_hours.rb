class CreateOperationalHours < ActiveRecord::Migration[5.1]
  def change
    create_table :operational_hours do |t|
      t.string :operational_hours_type, :null => false, :default => 'DEFAULT'
      t.time :open, :null => false, :default => '8:00:00'
      t.time :close, :null => false, :default => '20:00:00'
      t.date :special_date

      t.timestamps
    end

    add_reference :operational_hours, :retailer, foreign_key: true
  end
end
