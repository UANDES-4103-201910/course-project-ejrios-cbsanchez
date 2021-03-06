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

ActiveRecord::Schema.define(version: 2019_06_11_030624) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "adminstrators", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "nickname"
    t.string "email"
    t.string "country"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_access_at"
  end

  create_table "black_lists", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_black_lists_on_user_id"
  end

  create_table "commentaries", force: :cascade do |t|
    t.text "texto"
    t.string "country"
    t.string "city"
    t.integer "user_id"
    t.integer "post_id"
    t.string "photo"
    t.string "file"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_commentaries_on_post_id"
    t.index ["user_id"], name: "index_commentaries_on_user_id"
  end

  create_table "downvotes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_downvotes_on_post_id"
    t.index ["user_id"], name: "index_downvotes_on_user_id"
  end

  create_table "dump_lists", force: :cascade do |t|
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_dump_lists_on_post_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_follows_on_post_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "inappropiates", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "datecreate"
    t.index ["post_id"], name: "index_inappropiates_on_post_id"
    t.index ["user_id"], name: "index_inappropiates_on_user_id"
  end

  create_table "location_admins", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "adminstrator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adminstrator_id"], name: "index_location_admins_on_adminstrator_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_locations_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "user_id"
    t.string "type_of_post"
    t.string "country"
    t.string "city"
    t.string "photo"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "super_admins", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "nickname"
    t.string "email"
    t.string "e_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_access_at"
  end

  create_table "upvotes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_upvotes_on_post_id"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_user_profiles_on_post_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.string "country"
    t.string "city"
    t.text "biography"
    t.string "password"
    t.string "photo"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "remember_digest"
    t.datetime "last_access_at"
    t.string "provider"
    t.string "uid"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "password_digest"
  end

end
