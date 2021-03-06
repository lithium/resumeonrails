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

ActiveRecord::Schema.define(version: 20130922232157) do

  create_table "page_sample_associations", force: true do |t|
    t.integer  "page_id"
    t.integer  "sample_id"
    t.integer  "position",   default: 9
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_skill_associations", force: true do |t|
    t.integer  "page_id"
    t.integer  "skill_id"
    t.integer  "position",   default: 9
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_work_history_associations", force: true do |t|
    t.integer  "page_id"
    t.integer  "work_history_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "slug"
    t.text     "header"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layout"
    t.string   "title"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "samples", force: true do |t|
    t.string   "name"
    t.string   "platform"
    t.string   "source_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screenshot_file_name"
    t.string   "screenshot_content_type"
    t.integer  "screenshot_file_size"
    t.datetime "screenshot_updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "work_histories", force: true do |t|
    t.string   "company"
    t.string   "position"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "address"
    t.text     "contact_info"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
