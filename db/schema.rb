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

ActiveRecord::Schema.define(version: 2019_02_03_234130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.date "date"
    t.boolean "locked"
    t.bigint "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politician_id"], name: "index_events_on_politician_id"
  end

  create_table "old_replicas", force: :cascade do |t|
    t.bigint "superior"
    t.bigint "subordinate"
    t.bigint "politician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["politician_id"], name: "index_old_replicas_on_politician_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.date "starting_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "superior_id"
    t.bigint "subordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "politicians"
  add_foreign_key "old_replicas", "politicians"
end
