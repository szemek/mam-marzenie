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

ActiveRecord::Schema.define(version: 20140411055411) do

  create_table "comments", force: true do |t|
    t.integer  "dream_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dreams", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "child_fullname"
    t.integer  "child_age"
    t.string   "region"
    t.string   "category"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "website"
    t.integer  "step"
  end

  create_table "members", force: true do |t|
    t.integer  "user_id"
    t.integer  "dream_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["dream_id"], name: "index_members_on_dream_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "sponsors", force: true do |t|
    t.string   "fullname"
    t.string   "description"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "dream_id"
    t.integer  "sponsor_id"
    t.integer  "user_id"
    t.boolean  "result"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["dream_id"], name: "index_tasks_on_dream_id"
  add_index "tasks", ["sponsor_id"], name: "index_tasks_on_sponsor_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fullname"
    t.string   "region"
    t.string   "phone"
    t.datetime "last_activity_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
