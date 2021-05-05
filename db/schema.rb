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

ActiveRecord::Schema.define(version: 2021_05_03_114629) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "part_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "quantity"
    t.decimal "rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "part_order_id", null: false
    t.integer "received"
    t.index ["part_order_id"], name: "index_part_items_on_part_order_id"
  end

  create_table "part_orders", force: :cascade do |t|
    t.string "part_name"
    t.text "part_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "quantity"
    t.float "total"
    t.string "vendor"
    t.string "vendor_contact"
    t.text "vendor_address"
    t.string "mhr_number"
    t.string "po_number"
    t.string "vendor_id"
    t.datetime "delivery_date"
    t.decimal "price"
    t.integer "status", default: 0
  end

  create_table "parts", force: :cascade do |t|
    t.text "description"
    t.string "location"
    t.integer "quantity"
    t.string "mfr_number"
    t.string "barcode"
    t.string "machine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "part_order_id"
    t.decimal "rate"
    t.index ["part_order_id"], name: "index_parts_on_part_order_id"
  end

  create_table "parts_vendors", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "part_id"
    t.index ["part_id"], name: "index_parts_vendors_on_part_id"
    t.index ["vendor_id"], name: "index_parts_vendors_on_vendor_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "policy_roles", force: :cascade do |t|
    t.integer "policy_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["policy_id"], name: "index_policy_roles_on_policy_id"
    t.index ["role_id"], name: "index_policy_roles_on_role_id"
  end

  create_table "policy_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "policy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["policy_id"], name: "index_policy_users_on_policy_id"
    t.index ["user_id"], name: "index_policy_users_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contact_person"
    t.text "address"
    t.string "code"
    t.string "phone_number"
    t.string "email_address"
  end

  create_table "work_order_requests", force: :cascade do |t|
    t.string "location"
    t.string "issue"
    t.string "line"
    t.string "machine"
    t.string "work_order_type"
    t.datetime "request_date_time"
    t.string "level_of_issue"
    t.string "requested_by"
    t.string "email"
    t.string "description_of_issue"
    t.datetime "planned_date_and_time"
    t.datetime "complete_date_and_time"
    t.boolean "recurring"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "location"
    t.string "issue"
    t.string "line"
    t.string "machine"
    t.string "work_order_type"
    t.datetime "request_date_time"
    t.string "level_of_issue"
    t.string "requested_by"
    t.string "email"
    t.string "description_of_issue"
    t.datetime "planned_date_and_time"
    t.datetime "complete_date_and_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "recurring"
    t.integer "status", default: 0
    t.string "recurring_frequency"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "part_items", "part_orders"
  add_foreign_key "parts", "part_orders"
  add_foreign_key "policy_roles", "policies"
  add_foreign_key "policy_roles", "roles"
  add_foreign_key "policy_users", "policies"
  add_foreign_key "policy_users", "users"
end
