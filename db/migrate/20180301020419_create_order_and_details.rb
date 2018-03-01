class CreateOrderAndDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :user_orders do |t|
      t.string :status, :null => false

      t.timestamps
    end

    create_table :vendor_orders do |t|
      t.string :status, :null => false

      t.timestamps
    end

    create_table :order_details do |t|
      t.decimal :price, :null => false
      t.integer :quantity, :null => false
      t.decimal :discount

      t.timestamps
    end

    add_reference :user_orders, :user, foreign_key: true

    add_reference :vendor_orders, :user_order, foreign_key: true
    add_reference :vendor_orders, :vendor, foreign_key: true

    add_reference :order_details, :user_order, foreign_key: true
    add_reference :order_details, :vendor_order, foreign_key: true
    add_reference :order_details, :item, foreign_key: true
  end
end
