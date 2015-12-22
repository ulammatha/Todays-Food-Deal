# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151219181143) do

  create_table "coupons", force: true do |t|
    t.string   "code"
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_id",                null: false
    t.boolean  "status",     default: true
  end

  create_table "deals", force: true do |t|
    t.integer  "rank"
    t.string   "name"
    t.string   "description"
    t.decimal  "current_amount",     precision: 8, scale: 2
    t.decimal  "previous_amount",    precision: 8, scale: 2
    t.datetime "expiry"
    t.integer  "available_coupons"
    t.integer  "sold_coupons",                               default: 0
    t.integer  "eatery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "deleted_at"
  end

  add_index "deals", ["eatery_id"], name: "index_deals_on_eatery_id", using: :btree
  add_index "deals", ["rank"], name: "index_deals_on_rank", using: :btree

  create_table "eateries", force: true do |t|
    t.string   "eatery_name"
    t.string   "eatery_description"
    t.string   "eatery_contact"
    t.string   "eatery_email"
    t.string   "eatery_address"
    t.integer  "customer_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.string   "stripe_token"
    t.boolean  "transaction_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",             precision: 8, scale: 2
  end

  create_table "reviews", force: true do |t|
    t.integer  "deal_id",    null: false
    t.integer  "user_id",    null: false
    t.integer  "rating",     null: false
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_vendor",              default: false
    t.boolean  "is_admin",               default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
