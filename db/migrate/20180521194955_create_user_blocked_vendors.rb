class CreateUserBlockedVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :user_blocked_vendors do |t|
      t.string :reason
    end

    add_reference :user_blocked_vendors, :vendor, foreign_key: true
    add_reference :user_blocked_vendors, :user, foreign_key: true
  end
end
