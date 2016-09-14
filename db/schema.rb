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

ActiveRecord::Schema.define(version: 20160910151704) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "username"
    t.integer  "user_id"
    t.string   "permission"
    t.string   "status"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battle_games", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "strength",     default: "0.0", null: false
    t.decimal  "agility",      default: "0.0", null: false
    t.decimal  "wit",          default: "0.0", null: false
    t.decimal  "speed",        default: "0.0", null: false
    t.decimal  "wisdom",       default: "0.0", null: false
    t.decimal  "intelligence", default: "0.0", null: false
    t.decimal  "magic",        default: "0.0", null: false
    t.decimal  "chi",          default: "0.0", null: false
    t.decimal  "healing",      default: "0.0", null: false
    t.string   "status"
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "battles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "call_auth_code"
    t.integer  "original_id"
    t.integer  "arena_id"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "pet1_id"
    t.integer  "pet2_id"
    t.datetime "battled_on"
    t.integer  "winning_pet_id"
    t.integer  "winning_user_id"
    t.integer  "battle_game_id"
    t.string   "status"
    t.decimal  "score"
    t.boolean  "play_for_keeps",    default: false, null: false
    t.boolean  "is_tie",            default: false, null: false
    t.integer  "winner_experience", default: 0,     null: false
    t.integer  "loser_experience",  default: 0,     null: false
    t.integer  "winner_gold",       default: 0,     null: false
    t.integer  "updated_by"
    t.integer  "created_by"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
