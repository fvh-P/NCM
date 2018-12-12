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

ActiveRecord::Schema.define(version: 20181212150029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "idols", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mastodon_clients", force: :cascade do |t|
    t.string "domain"
    t.string "client_id"
    t.string "client_secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "name_card_idols", force: :cascade do |t|
    t.bigint "name_card_id"
    t.bigint "idol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idol_id"], name: "index_name_card_idols_on_idol_id"
    t.index ["name_card_id"], name: "index_name_card_idols_on_name_card_id"
  end

  create_table "name_cards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "free_text", limit: 1000
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "card_name", limit: 32
    t.string "image_back"
    t.string "twitter_account_name"
    t.string "mastodon_account_name"
    t.string "mastodon_instance_name"
    t.string "free_account"
    t.index ["user_id"], name: "index_name_cards_on_user_id"
  end

  create_table "received_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "name_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_card_id"], name: "index_received_cards_on_name_card_id"
    t.index ["user_id"], name: "index_received_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "name_card_idols", "idols"
  add_foreign_key "name_card_idols", "name_cards"
end
