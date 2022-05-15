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

ActiveRecord::Schema.define(version: 2022_05_15_171235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disc_warehouses", force: :cascade do |t|
    t.bigint "disc_id"
    t.bigint "warehouse_id"
    t.index ["disc_id"], name: "index_disc_warehouses_on_disc_id"
    t.index ["warehouse_id"], name: "index_disc_warehouses_on_warehouse_id"
  end

  create_table "discs", force: :cascade do |t|
    t.string "name"
    t.string "plastic"
    t.integer "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "disc_warehouses", "discs"
  add_foreign_key "disc_warehouses", "warehouses"
end
