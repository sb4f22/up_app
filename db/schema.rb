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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121118221814) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "coop_name"
    t.string   "coop_location"
    t.string   "short_description"
    t.string   "long_description"
    t.string   "video_link"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "request"
    t.boolean  "active",             :default => false
    t.date     "end_date"
  end

  add_index "campaigns", ["category"], :name => "index_campaigns_on_category"
  add_index "campaigns", ["coop_location"], :name => "index_campaigns_on_coop_location"
  add_index "campaigns", ["coop_name"], :name => "index_campaigns_on_coop_name"
  add_index "campaigns", ["user_id", "created_at"], :name => "index_campaigns_on_user_id_and_created_at"

  create_table "gifts", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.integer  "count"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "gifts", ["user_id", "price"], :name => "index_gifts_on_user_id_and_price"

  create_table "relationships", :force => true do |t|
    t.integer  "funder_id"
    t.integer  "funded_id"
    t.decimal  "amount"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "gift_id"
    t.string   "description"
    t.string   "type"
    t.integer  "checkout_id"
    t.string   "checkout_uri"
  end

  add_index "relationships", ["amount"], :name => "index_relationships_on_amount"
  add_index "relationships", ["funded_id"], :name => "index_relationships_on_funded_id"
  add_index "relationships", ["funder_id", "funded_id"], :name => "index_relationships_on_funder_id_and_funded_id"
  add_index "relationships", ["funder_id"], :name => "index_relationships_on_funder_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             :default => false
    t.string   "wepay_token"
    t.integer  "wepay_id"
    t.integer  "wepay_account_id"
    t.string   "wepay_account_uri"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wepay_checkout_records", :force => true do |t|
    t.integer  "checkout_id"
    t.integer  "account_id"
    t.string   "state"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "currency"
    t.decimal  "amount"
    t.decimal  "app_fee"
    t.string   "fee_payer"
    t.decimal  "gross"
    t.decimal  "fee"
    t.string   "reference_id"
    t.text     "redirect_uri"
    t.text     "callback_uri"
    t.text     "checkout_uri"
    t.string   "payer_email"
    t.string   "payer_name"
    t.text     "cancel_reason"
    t.text     "refund_reason"
    t.boolean  "auto_capture"
    t.boolean  "require_shipping"
    t.text     "shipping_address"
    t.decimal  "tax"
    t.string   "security_token"
    t.string   "access_token"
    t.string   "mode"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "wepay_checkout_records", ["checkout_id"], :name => "index_wepay_checkout_records_on_checkout_id"

end
