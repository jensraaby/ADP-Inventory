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

ActiveRecord::Schema.define(:version => 20130423080039) do

  create_table "mobiles", :force => true do |t|
    t.string   "serial"
    t.string   "name"
    t.string   "model"
    t.string   "OS"
    t.string   "IMEI"
    t.string   "ICCID"
    t.string   "phone_number"
    t.text     "information"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "registrations", :force => true do |t|
    t.string   "device_type"
    t.integer  "device_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "sAMAccountName"
    t.string   "userPrincipalName"
    t.string   "mail"
    t.string   "givenName"
    t.string   "sn"
    t.string   "displayName"
    t.string   "telephoneNumber"
    t.boolean  "active"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "workstations", :force => true do |t|
    t.string   "serial"
    t.string   "name"
    t.string   "model"
    t.string   "OS"
    t.text     "information"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
