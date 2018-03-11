class DeviseTokenAuthCreateVendors < ActiveRecord::Migration[5.1]
  def change
    ## Required
    add_column :vendors, :provider, :string, :null => false, :default => "email"
    add_column :vendors, :uid, :string, :null => false, :default => ""

    ## Database authenticatable
    add_column :vendors, :encrypted_password, :string, :null => false, :default => ""

    ## Recoverable
    add_column :vendors, :reset_password_token, :string
    add_column :vendors, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :vendors, :remember_created_at, :datetime

    ## Trackable
    add_column :vendors, :sign_in_count, :integer, :default => 0, :null => false
    add_column :vendors, :current_sign_in_at, :datetime
    add_column :vendors, :last_sign_in_at, :datetime
    add_column :vendors, :current_sign_in_ip, :string
    add_column :vendors, :last_sign_in_ip, :string

    ## Confirmable
    add_column :vendors, :confirmation_token, :string
    add_column :vendors, :confirmed_at, :datetime
    add_column :vendors, :confirmation_sent_at, :datetime
    add_column :vendors, :unconfirmed_email, :string # Only if using reconfirmable

    ## Lockable
    # add_column :vendors, :failed_attempts, :integer, :default => 0, :null => false # Only if lock strategy is :failed_attempts
    # add_column :vendors, :unlock_token, :string # Only if unlock strategy is :email or :both
    # add_column :vendors, :locked_at, :datetime

    ## User Info
    add_column :vendors, :email, :string

    ## Tokens
    add_column :vendors, :tokens, :json

    Vendor.reset_column_information

    # finds all existing users and updates them.
    # if you change the default values above you'll also have to change them here below:
    Vendor.find_each do |vendor|
      vendor.email = vendor.id.to_s + '@example.org'
      vendor.uid = vendor.email
      vendor.provider = 'email'
      vendor.save!
    end

    add_index :vendors, :email,                unique: true
    add_index :vendors, [:uid, :provider],     unique: true
    add_index :vendors, :reset_password_token, unique: true
    add_index :vendors, :confirmation_token,   unique: true
    # add_index :vendors, :unlock_token,       unique: true
  end
end
