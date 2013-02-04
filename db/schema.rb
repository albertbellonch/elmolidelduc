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

ActiveRecord::Schema.define(:version => 20130204234412) do

  create_table "assets", :force => true do |t|
    t.string    "type"
    t.integer   "owner_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "file"
    t.string    "owner_type"
  end

  create_table "boats", :force => true do |t|
    t.string   "name"
    t.boolean  "individual_booking"
    t.text     "characteristics"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "manager_id"
  end

  create_table "bookings", :force => true do |t|
    t.string   "contact_name"
    t.string   "contact_email"
    t.text     "comment"
    t.boolean  "paid",          :default => false
    t.integer  "user_id"
    t.integer  "period_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "bookings", ["user_id"], :name => "index_bookings_on_user_id"

  create_table "comments", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.text      "body"
    t.integer   "post_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "file"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_contents", :force => true do |t|
    t.string    "locale"
    t.string    "url"
    t.integer   "page_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string    "key"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "body"
  end

  create_table "periods", :force => true do |t|
    t.date     "init_date"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "status"
    t.text     "comments"
    t.string   "pax"
    t.boolean  "closed",     :default => false
    t.integer  "boat_id"
    t.integer  "route_id"
    t.date     "end_date"
  end

  create_table "posts", :force => true do |t|
    t.string    "title"
    t.text      "body"
    t.date      "date"
    t.integer   "user_id"
    t.boolean   "published"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "published_at"
  end

  create_table "products", :force => true do |t|
    t.string    "collection"
    t.string    "description"
    t.string    "image"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "reference"
    t.string    "title"
  end

  create_table "room_bookings", :force => true do |t|
    t.integer  "room_id"
    t.integer  "booking_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "room_bookings", ["booking_id"], :name => "index_room_bookings_on_booking_id"
  add_index "room_bookings", ["room_id"], :name => "index_room_bookings_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "room_type"
    t.integer  "total_rooms"
    t.integer  "boat_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.date     "start_month"
    t.date     "end_month"
    t.text     "atolon_list"
    t.integer  "duration",    :default => 7
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "shared_images", :force => true do |t|
    t.string    "name"
    t.string    "surname"
    t.string    "email"
    t.text      "description"
    t.string    "image"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "published",   :default => false
    t.string    "phone"
  end

  create_table "subscriptors", :force => true do |t|
    t.string    "name"
    t.string    "last_name"
    t.string    "token"
    t.string    "email"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "company"
    t.string    "charge"
    t.string    "phone"
  end

  create_table "translations", :force => true do |t|
    t.string  "locale"
    t.string  "key"
    t.text    "value"
    t.text    "interpolations"
    t.boolean "is_proc",        :default => false
    t.boolean "protected",      :default => false
  end

  create_table "users", :force => true do |t|
    t.string    "email",                              :default => "", :null => false
    t.string    "encrypted_password",  :limit => 128, :default => "", :null => false
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                      :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "login"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
