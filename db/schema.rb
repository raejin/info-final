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

ActiveRecord::Schema.define(version: 0) do

  create_table "Hashtags", id: false, force: true do |t|
    t.string  "text", limit: 20
    t.integer "tid",  limit: 8,  null: false
  end

  add_index "hashtags", ["tid"], name: "tid", using: :btree

  create_table "Mentions", id: false, force: true do |t|
    t.integer "uid", limit: 8, null: false
    t.integer "tid", limit: 8, null: false
  end

  add_index "mentions", ["tid"], name: "tid", using: :btree
  add_index "mentions", ["uid"], name: "uid", using: :btree

  create_table "Tweets", force: true do |t|
    t.integer  "uid",            limit: 8,   null: false
    t.string   "content",        limit: 140
    t.datetime "created_at"
    t.text     "source"
    t.integer  "sentiment"
    t.integer  "retweet_count"
    t.integer  "favorite_count"
  end

  add_index "tweets", ["uid"], name: "uid", using: :btree

  create_table "Users", force: true do |t|
    t.string   "handle",          limit: 16
    t.string   "name",            limit: 20
    t.string   "description",     limit: 160
    t.text     "url"
    t.text     "time_zone"
    t.integer  "followers_count"
    t.integer  "friends_count"
    t.datetime "created_at"
    t.integer  "favorites_count"
  end

  create_table "iOS7_update", id: false, force: true do |t|
    t.integer "uid",       limit: 8, null: false
    t.integer "tid",       limit: 8, null: false
    t.integer "sentiment"
  end

  add_index "ios7_update", ["tid"], name: "tid", using: :btree
  add_index "ios7_update", ["uid"], name: "uid", using: :btree

end
