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

ActiveRecord::Schema.define(version: 20170806182428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "user_id"
    t.text     "text"
    t.integer  "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "record_id"
    t.text     "text"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dataset_fields", force: :cascade do |t|
    t.integer  "dataset_id"
    t.string   "field_name"
    t.string   "title"
    t.string   "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dataset_id"], name: "index_dataset_fields_on_dataset_id", using: :btree
  end

  create_table "dataset_records", force: :cascade do |t|
    t.integer  "dataset_id"
    t.string   "external_identifier"
    t.string   "external_url"
    t.text     "data"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["dataset_id"], name: "index_dataset_records_on_dataset_id", using: :btree
  end

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "rating"
    t.integer  "rating_count"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "record_id"
    t.integer  "dataset_id"
    t.integer  "rate_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "admin"
    t.string   "encrypted_password"
    t.string   "salt"
    t.integer  "reliability"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "dataset_fields", "datasets"
  add_foreign_key "dataset_records", "datasets"
end
