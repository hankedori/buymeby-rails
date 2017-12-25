class CreateRetailers < ActiveRecord::Migration[5.1]
  def change
    create_table :retailers do |t|
      t.string :name, :null => false
      t.string :description
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
