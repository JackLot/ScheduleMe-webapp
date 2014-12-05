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

ActiveRecord::Schema.define(:version => 20141205221054) do

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "admin"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "memberships", :force => true do |t|
    t.string "group_name"
    t.string "did"
  end

  create_table "schedules", :force => true do |t|
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "schedules", ["user_id"], :name => "index_schedules_on_user_id"

  create_table "testudos", :force => true do |t|
    t.string   "classid"
    t.string   "classname"
    t.integer  "credits"
    t.text     "description"
    t.integer  "section"
    t.string   "instructor"
    t.text     "sectiondays"
    t.text     "starttimes"
    t.text     "endtimes"
    t.text     "building"
    t.text     "classroom"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "did"
  end

  add_index "testudos", ["did"], :name => "index_testudos_on_did"

  create_table "users", :force => true do |t|
    t.string   "did"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "phone"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
