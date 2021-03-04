# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_04_180148) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "billings", force: :cascade do |t|
    t.date "accounted_at"
    t.integer "client_id", null: false
    t.integer "payment_method_id", null: false
    t.decimal "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_billings_on_client_id"
    t.index ["payment_method_id"], name: "index_billings_on_payment_method_id"
  end

  create_table "client_payment_methods", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "payment_method_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_client_payment_methods_on_client_id"
    t.index ["payment_method_id"], name: "index_client_payment_methods_on_payment_method_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "last_billed_at"
    t.date "billing_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "billings", "clients"
  add_foreign_key "billings", "payment_methods"
  add_foreign_key "client_payment_methods", "clients"
  add_foreign_key "client_payment_methods", "payment_methods"
end
