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

ActiveRecord::Schema.define(version: 2019_12_30_060840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_reader_interactions", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "taken_at"
    t.datetime "returned_at"
    t.index ["book_id"], name: "index_book_reader_interactions_on_book_id"
    t.index ["user_id"], name: "index_book_reader_interactions_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "authors", null: false
    t.string "description"
    t.string "isbn_10"
    t.string "isbn_13"
    t.string "publisher"
    t.string "cover_image"
    t.integer "page_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_items_count", default: 1, null: false
    t.integer "available_items_count", default: 1, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "avatar"
    t.string "google_uid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["google_uid"], name: "index_users_on_google_uid"
  end

  add_foreign_key "book_reader_interactions", "books"
  add_foreign_key "book_reader_interactions", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
