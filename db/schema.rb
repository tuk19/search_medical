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

ActiveRecord::Schema.define(version: 2021_07_29_110417) do

  create_table "consultationhours", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.string "monday"
    t.string "tuesday"
    t.string "wednesday"
    t.string "thursday"
    t.string "friday"
    t.string "saturday"
    t.string "sunday"
    t.string "holiday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "institution_id"
    t.string "detail"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_favorites_on_institution_id"
    t.index ["user_id", "institution_id"], name: "index_favorites_on_user_id_and_institution_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "postcode"
    t.integer "prefecture_code"
    t.string "address_city"
    t.string "address_street"
    t.string "address_building"
    t.string "prefecture"
  end

  create_table "medicalstaffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "address"
    t.index ["email"], name: "index_medicalstaffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_medicalstaffs_on_reset_password_token", unique: true
  end

  create_table "staff_institutions", force: :cascade do |t|
    t.integer "medicalstaff_id", null: false
    t.integer "institution_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["institution_id"], name: "index_staff_institutions_on_institution_id"
    t.index ["medicalstaff_id", "institution_id"], name: "index_staff_institutions_on_medicalstaff_id_and_institution_id", unique: true
    t.index ["medicalstaff_id"], name: "index_staff_institutions_on_medicalstaff_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "institutions"
  add_foreign_key "favorites", "users"
  add_foreign_key "staff_institutions", "institutions"
  add_foreign_key "staff_institutions", "medicalstaffs"
end
