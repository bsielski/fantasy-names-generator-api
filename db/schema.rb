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

ActiveRecord::Schema.define(version: 20171018150929) do

  create_table "groups", force: :cascade do |t|
    t.string "label", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subgroups_count"
    t.boolean "custom", default: false
  end

  create_table "names", force: :cascade do |t|
    t.integer "nameset_id", null: false
    t.text "variants", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["nameset_id"], name: "index_names_on_nameset_id"
    t.index ["position"], name: "index_names_on_position"
  end

  create_table "namesets", force: :cascade do |t|
    t.integer "subgroup_id"
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
    t.integer "group_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "namesets_count"
    t.index ["group_id"], name: "index_subgroups_on_group_id"
  end

end
