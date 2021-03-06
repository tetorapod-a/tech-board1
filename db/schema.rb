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

ActiveRecord::Schema.define(version: 2020_06_08_061531) do

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id"
    t.bigint "plan_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_comments_on_plan_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_favorites_on_plan_id"
    t.index ["user_id", "plan_id"], name: "index_favorites_on_user_id_and_plan_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "start"
    t.datetime "end"
    t.string "place"
    t.text "place_url"
    t.string "client"
    t.string "body1"
    t.string "body2"
    t.string "body3"
    t.string "body4"
    t.text "detail"
    t.date "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_plans_on_id"
    t.index ["name"], name: "index_plans_on_name"
  end

  create_table "user_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_user_plans_on_plan_id"
    t.index ["user_id"], name: "index_user_plans_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "plans"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "plans"
  add_foreign_key "favorites", "users"
  add_foreign_key "user_plans", "plans"
  add_foreign_key "user_plans", "users"
end
