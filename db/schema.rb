# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_17_001528) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "goal_recurrances", ["weekly", "daily", "monthly", "quarterly", "yearly", "never"]

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "balance", null: false
    t.boolean "debt", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "target_date", null: false
    t.enum "recurrance", default: "monthly", null: false, enum_type: "goal_recurrances"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "identity", default: -> { "gen_random_uuid()" }, null: false
  end

  add_foreign_key "accounts", "users", on_delete: :cascade
  add_foreign_key "goals", "users", on_delete: :cascade
  add_foreign_key "savings", "users", on_delete: :cascade
end
