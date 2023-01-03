# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_03_051336) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "CreateCategories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_requests", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "request_id", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.bigint "user_id", null: false
    t.boolean "is_confirm", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "request_id", null: false
    t.boolean "is_approve", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_responses_on_request_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password_digest"
    t.integer "karma", default: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "requests", "users"
  add_foreign_key "responses", "requests"
  add_foreign_key "responses", "users"
end
