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

ActiveRecord::Schema.define(version: 20170924101752) do

  create_table "addadmins", force: :cascade do |t|
    t.string "empid"
    t.string "name"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.text "CIN"
    t.text "title"
    t.text "content"
    t.string "tofrom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mrecruiters", force: :cascade do |t|
    t.string "name"
    t.string "logopath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.text "cin"
    t.text "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "year"
    t.string "company"
    t.string "offers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.text "sid"
    t.text "sname"
    t.text "cno"
    t.text "cname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rregisters", force: :cascade do |t|
    t.string "cinno"
    t.string "company"
    t.string "name"
    t.string "link"
    t.string "cno"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salary"
  end

  create_table "sregisters", force: :cascade do |t|
    t.string "rno"
    t.string "name"
    t.string "cgpa"
    t.string "branch"
    t.string "cno"
    t.string "mail"
    t.string "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uname"
    t.string "pword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "salt"
    t.string "utype"
    t.string "status"
  end

end
