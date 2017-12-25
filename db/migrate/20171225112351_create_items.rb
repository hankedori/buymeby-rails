class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.string :unit, :null => false
      t.decimal :price, :null => false
      t.integer :quantity, :null => false
      t.string :category, :null => false

      t.timestamps
    end

    add_reference :items, :retailer, foreign_key: true
  end
end
