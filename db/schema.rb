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

ActiveRecord::Schema.define(version: 20141001194426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_classes", force: true do |t|
    t.integer  "blizzard_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_specs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "character_class_id"
  end

  add_index "class_specs", ["character_class_id"], name: "index_class_specs_on_character_class_id", using: :btree

  create_table "class_specs_spells", id: false, force: true do |t|
    t.integer "class_spec_id"
    t.integer "spell_id"
  end

  create_table "effects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "effects_spells", id: false, force: true do |t|
    t.integer "spell_id"
    t.integer "effect_id"
  end

  add_index "effects_spells", ["spell_id", "effect_id"], name: "by_effect_and_spell", unique: true, using: :btree

  create_table "spells", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
