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

ActiveRecord::Schema.define(version: 20140505220213) do

  create_table "deals", force: true do |t|
    t.integer  "rank"
    t.string   "recipe_name"
    t.string   "description"
    t.decimal  "current_amount",     precision: 8, scale: 2
    t.decimal  "previous_amount",    precision: 8, scale: 2
    t.decimal  "discount",           precision: 8, scale: 2
    t.datetime "expiry"
    t.string   "coupon_code"
    t.integer  "available_coupons"
    t.integer  "sold_coupons"
    t.integer  "eatery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
  end

end