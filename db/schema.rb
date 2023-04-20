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

ActiveRecord::Schema.define(version: 2023_04_20_135906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ammos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "manufacturer_id"
    t.text "name"
    t.text "calibre"
    t.integer "bullet_velocity"
    t.integer "fragmentation_chance"
    t.integer "ricochet_chance"
    t.integer "quantity"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ammos_firearms", force: :cascade do |t|
    t.integer "ammo_id"
    t.integer "firearm_id"
  end

  create_table "firearms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "manufacturer_id"
    t.text "model"
    t.text "calibre"
    t.text "family"
    t.integer "fire_rate"
    t.integer "effective_distance"
    t.integer "quantity"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.text "name"
    t.text "founder"
    t.integer "founded"
    t.text "country"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
