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

ActiveRecord::Schema.define(version: 20140401044906) do

  create_table "cases", force: true do |t|
    t.string "condition"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "tel"
    t.date     "birthday"
    t.string   "ssn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "validemail",      default: false
    t.boolean  "jamba",           default: false
    t.boolean  "cases",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "whitelists", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.integer  "user_id"
    t.string   "email"
    t.integer  "ssn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
