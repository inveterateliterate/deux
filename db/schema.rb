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

ActiveRecord::Schema.define(version: 20180207162421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_running_exercises", force: :cascade do |t|
    t.bigint "day_id"
    t.string "runnable_type"
    t.bigint "runnable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_day_running_exercises_on_day_id"
    t.index ["runnable_type", "runnable_id"], name: "index_day_running_exercises_on_runnable_type_and_runnable_id"
  end

  create_table "days", force: :cascade do |t|
    t.integer "day_index"
    t.integer "week_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_index"], name: "index_days_on_day_index"
    t.index ["week_num"], name: "index_days_on_week_num"
  end

  create_table "hundreds", force: :cascade do |t|
    t.integer "num_times"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "long_runs", force: :cascade do |t|
    t.integer "amt_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mile_runs", force: :cascade do |t|
    t.string "type"
    t.integer "num_times"
    t.float "time_per"
    t.float "rest_between"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speed_trainings", force: :cascade do |t|
    t.integer "num_times"
    t.string "distance"
    t.integer "rep_seconds_rest"
    t.integer "round_minutes_rest"
    t.integer "round_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suicides", force: :cascade do |t|
    t.integer "num_times"
    t.integer "int_yds"
    t.integer "int_times"
    t.integer "round_minutes_rest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "day_running_exercises", "days"
end
