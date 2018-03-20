# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180320011640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.decimal "ratio", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "item_id"
    t.index ["item_id"], name: "index_discounts_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "unit", null: false
    t.decimal "price", null: false
    t.integer "quantity", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.string "image_src"
    t.index ["vendor_id"], name: "index_items_on_vendor_id"
  end

  create_table "operational_hours", force: :cascade do |t|
    t.string "operational_hours_type", default: "DEFAULT", null: false
    t.time "open", default: "2000-01-01 08:00:00"
    t.time "close", default: "2000-01-01 20:00:00"
    t.date "special_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.string "day"
    t.index ["vendor_id"], name: "index_operational_hours_on_vendor_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "price", null: false
    t.integer "quantity", null: false
    t.decimal "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_order_id"
    t.bigint "vendor_order_id"
    t.bigint "item_id"
    t.index ["item_id"], name: "index_order_details_on_item_id"
    t.index ["user_order_id"], name: "index_order_details_on_user_order_id"
    t.index ["vendor_order_id"], name: "index_order_details_on_vendor_order_id"
  end

  create_table "user_orders", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vendor_orders", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_order_id"
    t.bigint "vendor_id"
    t.index ["user_order_id"], name: "index_vendor_orders_on_user_order_id"
    t.index ["vendor_id"], name: "index_vendor_orders_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_src"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.json "tokens"
    t.string "place_id"
    t.string "address"
    t.index ["confirmation_token"], name: "index_vendors_on_confirmation_token", unique: true
    t.index ["email"], name: "index_vendors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_vendors_on_uid_and_provider", unique: true
  end

  add_foreign_key "discounts", "items"
  add_foreign_key "items", "vendors"
  add_foreign_key "operational_hours", "vendors"
  add_foreign_key "order_details", "items"
  add_foreign_key "order_details", "user_orders"
  add_foreign_key "order_details", "vendor_orders"
  add_foreign_key "user_orders", "users"
  add_foreign_key "vendor_orders", "user_orders"
  add_foreign_key "vendor_orders", "vendors"
end
