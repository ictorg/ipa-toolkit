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

ActiveRecord::Schema.define(version: 2021_05_17_144753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.string "tenant_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dossiers", force: :cascade do |t|
    t.bigint "affiliation_id"
    t.bigint "candidate_id"
    t.bigint "primary_expert_id"
    t.bigint "secondary_expert_id"
    t.bigint "company_contact_id"
    t.string "company_points_a"
    t.string "company_points_b"
    t.string "company_mark_a"
    t.string "company_mark_b"
    t.string "expert_points_a"
    t.string "expert_points_b"
    t.string "expert_points_c"
    t.string "expert_mark_a"
    t.string "expert_mark_b"
    t.string "expert_mark_c"
    t.boolean "mark_deduction"
    t.string "final_mark"
    t.string "submitted_mark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["affiliation_id"], name: "index_dossiers_on_affiliation_id"
    t.index ["candidate_id"], name: "index_dossiers_on_candidate_id"
    t.index ["company_contact_id"], name: "index_dossiers_on_company_contact_id"
    t.index ["primary_expert_id"], name: "index_dossiers_on_primary_expert_id"
    t.index ["secondary_expert_id"], name: "index_dossiers_on_secondary_expert_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "forename"
    t.string "surname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "dossiers", "affiliations"
  add_foreign_key "dossiers", "people", column: "candidate_id"
  add_foreign_key "dossiers", "people", column: "company_contact_id"
  add_foreign_key "dossiers", "people", column: "primary_expert_id"
  add_foreign_key "dossiers", "people", column: "secondary_expert_id"
end
