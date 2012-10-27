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

ActiveRecord::Schema.define(:version => 20121027210944) do

  create_table "campaigns", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "coop_name"
    t.string   "coop_location"
    t.string   "short_description"
    t.string   "long_description"
    t.string   "video_link"
    t.boolean  "active",             :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "campaigns", ["active"], :name => "index_campaigns_on_active"
  add_index "campaigns", ["category"], :name => "index_campaigns_on_category"
  add_index "campaigns", ["coop_location"], :name => "index_campaigns_on_coop_location"
  add_index "campaigns", ["coop_name"], :name => "index_campaigns_on_coop_name"
  add_index "campaigns", ["user_id", "created_at"], :name => "index_campaigns_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
