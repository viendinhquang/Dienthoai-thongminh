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

ActiveRecord::Schema.define(version: 20170815104307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
  end

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "content"
    t.string   "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id", using: :btree

  create_table "post_replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_comment_id"
    t.string   "content"
    t.string   "like"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "post_replies", ["post_comment_id"], name: "index_post_replies_on_post_comment_id", using: :btree
  add_index "post_replies", ["user_id"], name: "index_post_replies_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sub_category_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "posts", ["sub_category_id"], name: "index_posts_on_sub_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "content"
    t.string   "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_comments", ["product_id"], name: "index_product_comments_on_product_id", using: :btree
  add_index "product_comments", ["user_id"], name: "index_product_comments_on_user_id", using: :btree

  create_table "product_replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_comment_id"
    t.string   "content"
    t.string   "like"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "product_replies", ["product_comment_id"], name: "index_product_replies_on_product_comment_id", using: :btree
  add_index "product_replies", ["user_id"], name: "index_product_replies_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "made_in"
    t.string   "screen_size"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "sub_category_id"
    t.integer  "operating_system_id"
    t.integer  "producer_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tag_posts", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_posts", ["post_id"], name: "index_tag_posts_on_post_id", using: :btree
  add_index "tag_posts", ["tag_id"], name: "index_tag_posts_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color_code"
    t.string   "picture"
    t.integer  "product_id"
  end

  create_table "user_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_products", ["product_id"], name: "index_user_products_on_product_id", using: :btree
  add_index "user_products", ["user_id"], name: "index_user_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "birthday"
    t.string   "sex"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin"
    t.string   "password_confirmation"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "post_replies", "post_comments"
  add_foreign_key "post_replies", "users"
  add_foreign_key "posts", "sub_categories"
  add_foreign_key "posts", "users"
  add_foreign_key "product_comments", "products"
  add_foreign_key "product_comments", "users"
  add_foreign_key "product_replies", "product_comments"
  add_foreign_key "product_replies", "users"
  add_foreign_key "products", "operating_systems"
  add_foreign_key "products", "producers"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "tag_posts", "posts"
  add_foreign_key "tag_posts", "tags"
  add_foreign_key "type_colors", "products"
  add_foreign_key "user_products", "products"
  add_foreign_key "user_products", "users"
end
