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

ActiveRecord::Schema.define(version: 2018_10_11_161446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "age", default: "N/A"
    t.string "breed", default: "N/A"
    t.string "size", default: "N/A"
    t.string "sex"
    t.text "short_bio"
    t.string "picture_url", default: "http://www.dog-find.com/img/default-image-450.jpg"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.date "date"
    t.string "address"
    t.integer "zip_code"
    t.string "location_name"
    t.string "time"
    t.string "url"
    t.string "picture_url", default: "https://www.mountaineers.org/images/placeholder-images/RoutesPlacesDefaultImage.jpg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owner_meetups", force: :cascade do |t|
    t.bigint "owner_id"
    t.bigint "meetup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_owner_meetups_on_meetup_id"
    t.index ["owner_id"], name: "index_owner_meetups_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title", default: ""
    t.string "picture_url", default: "https://catking.in/wp-content/uploads/2017/02/default-profile-1.png"
    t.integer "zip_code"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dogs", "owners"
  add_foreign_key "owner_meetups", "meetups"
  add_foreign_key "owner_meetups", "owners"
end
