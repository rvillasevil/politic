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

ActiveRecord::Schema.define(version: 20171218001031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "contenido"
    t.integer  "reply"
  end

  create_table "comunidads", force: :cascade do |t|
    t.string  "comunidad"
    t.integer "capital_id"
  end

  create_table "estados", force: :cascade do |t|
    t.integer "ubicacionpaisid"
    t.string  "estadonombre"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "plaza_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plaza_id"], name: "index_groups_on_plaza_id", using: :btree
    t.index ["user_id", "plaza_id"], name: "index_groups_on_user_id_and_plaza_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.string   "video"
    t.string   "hashtag1"
    t.string   "hashtag2"
    t.string   "hashtag3"
    t.string   "link"
    t.integer  "plaza_id"
    t.boolean  "petition"
    t.string   "title"
    t.integer  "reply"
    t.string   "title_link"
    t.string   "photo_link"
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "municipios", force: :cascade do |t|
    t.string  "nombre"
    t.integer "id_provincia"
    t.integer "cod_municipio"
    t.integer "dc"
  end

  create_table "pais", force: :cascade do |t|
    t.string "paisnombre"
  end

  create_table "plazas", force: :cascade do |t|
    t.string   "name"
    t.string   "ciudad"
    t.string   "foto"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "description"
    t.boolean  "causa"
    t.boolean  "action"
    t.boolean  "administrative"
  end

  create_table "provincia", force: :cascade do |t|
    t.integer "id_provincia"
    t.string  "provincia"
    t.integer "comunidad_id"
  end

  create_table "pueblos", force: :cascade do |t|
    t.integer  "id_provincia"
    t.integer  "cod_municipio"
    t.integer  "DC"
    t.string   "nombre"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "ciudad"
    t.string   "profesion"
    t.string   "foto"
    t.integer  "followers_count",   default: 0
    t.string   "autonomia"
    t.boolean  "plaza"
    t.integer  "created_by"
    t.string   "linkedin"
    t.string   "description"
    t.string   "provincia"
    t.string   "pais"
    t.boolean  "candidate"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "micropost_id"
    t.integer  "user_id"
    t.integer  "like"
    t.integer  "dislike"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "microposts", "users"
end
