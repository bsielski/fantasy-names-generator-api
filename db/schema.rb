# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_24_192839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "label", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subgroups_count"
  end

  create_table "names", force: :cascade do |t|
    t.bigint "nameset_id", null: false
    t.text "variants", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["nameset_id"], name: "index_names_on_nameset_id"
    t.index ["position"], name: "index_names_on_position"
  end

  create_table "namesets", force: :cascade do |t|
    t.bigint "subgroup_id"
    t.integer "position"
    t.string "label", null: false
    t.text "source"
    t.string "name_separator", default: ";", null: false
    t.string "variant_separator", default: ",", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "names_count"
    t.index ["subgroup_id"], name: "index_namesets_on_subgroup_id"
  end

  create_table "subgroups", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "namesets_count"
    t.index ["group_id"], name: "index_subgroups_on_group_id"
  end

  add_foreign_key "names", "namesets"
  add_foreign_key "namesets", "subgroups"
  add_foreign_key "subgroups", "groups"
end
