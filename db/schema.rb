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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110318134043) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.integer  "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gem_items", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "version"
    t.integer  "version_downloads", :default => 0
    t.text     "authors"
    t.integer  "downloads",         :default => 0
    t.string   "project_uri"
    t.string   "gem_uri"
    t.string   "homepage_uri"
    t.string   "wiki_uri"
    t.string   "documentation_uri"
    t.string   "mailing_list_uri"
    t.string   "source_code_uri"
    t.string   "bug_tracker_uri"
    t.text     "dependencies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subscribed_count",  :default => 0
  end

  create_table "notifications", :force => true do |t|
    t.integer  "gem_item_id"
    t.string   "version"
    t.datetime "upgraded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribes", :force => true do |t|
    t.integer  "gem_item_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
