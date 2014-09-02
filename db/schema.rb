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

ActiveRecord::Schema.define(:version => 20140902213044) do

  create_table "events", :force => true do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "location"
    t.string   "location_coord"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "field"
    t.string   "title"
    t.boolean  "active"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "checked_in"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "points"
    t.string   "password_digest"
    t.string   "username"
    t.string   "photo"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

end
