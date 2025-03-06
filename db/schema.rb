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

ActiveRecord::Schema[7.1].define(version: 2025_03_06_190823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leagues", force: :cascade do |t|
    t.string "league_name"
    t.date "start_date"
    t.date "end_date"
    t.integer "number_of_teams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "image"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "league_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.date "match_date"
    t.integer "home_score"
    t.integer "away_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "jersey_number"
    t.date "dob"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.string "avatar"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "number_of_players"
    t.integer "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wins"
    t.integer "draws"
    t.integer "losses"
    t.integer "goals_for"
    t.integer "goals_against"
    t.integer "goal_difference"
    t.integer "points"
  end

end
