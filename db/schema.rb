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

ActiveRecord::Schema.define(version: 20170729015745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "badge_name"
    t.string "threshhold"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drill_groups", force: :cascade do |t|
    t.string "category"
    t.text "description"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drill_group_id"
    t.text "description"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_questions_on_drill_group_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin"
    t.integer "total_pts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.boolean "is_correct"
    t.text "last_answer"
    t.integer "num_attempts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_users_questions_on_question_id"
    t.index ["user_id"], name: "index_users_questions_on_user_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "drill_groups"
  add_foreign_key "questions", "users"
  add_foreign_key "users_questions", "questions"
  add_foreign_key "users_questions", "users"
end
