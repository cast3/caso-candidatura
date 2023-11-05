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

ActiveRecord::Schema[7.1].define(version: 2023_10_29_231523) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "identification"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidature_parties", force: :cascade do |t|
    t.bigint "candidature_id", null: false
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidature_id"], name: "index_candidature_parties_on_candidature_id"
    t.index ["party_id"], name: "index_candidature_parties_on_party_id"
  end

  create_table "candidatures", force: :cascade do |t|
    t.string "codeInscription"
    t.datetime "dateInscription"
    t.bigint "candidate_id", null: false
    t.bigint "municipality_id", null: false
    t.bigint "period_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidatures_on_candidate_id"
    t.index ["municipality_id"], name: "index_candidatures_on_municipality_id"
    t.index ["period_id"], name: "index_candidatures_on_period_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "daneCode"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "identification"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string "start_year"
    t.string "end_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "candidature_parties", "candidatures"
  add_foreign_key "candidature_parties", "parties"
  add_foreign_key "candidatures", "candidates"
  add_foreign_key "candidatures", "municipalities"
  add_foreign_key "candidatures", "periods"
end
