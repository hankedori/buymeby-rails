class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.decimal :ratio, :null => false, :default => 0

      t.timestamps
    end

    add_reference :discounts, :item, foreign_key: true
  end
end
