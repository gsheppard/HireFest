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

ActiveRecord::Schema.define(version: 20140701202208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: true do |t|
    t.string "author"
    t.string "location"
    t.string "email"
    t.text   "body"
    t.date   "date_posted"
  end

  create_table "seekers", force: true do |t|
    t.string  "author"
    t.boolean "remote"
    t.boolean "relocate"
    t.string  "resume"
    t.string  "email"
    t.date    "date_posted"
    t.text    "body"
  end

end
