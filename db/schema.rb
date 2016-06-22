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

ActiveRecord::Schema.define(version: 20160621132700) do

  create_table "academic_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "course"
    t.string   "university"
    t.date     "passing_year"
    t.float    "percentage"
    t.string   "stream"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "academic_details", ["user_id"], name: "index_academic_details_on_user_id", using: :btree

  create_table "bank_and_identity_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "account_no",  limit: 8
    t.string   "bank_name"
    t.string   "branch_name"
    t.string   "city"
    t.string   "ifsc_code"
    t.string   "pancard_no"
    t.string   "passport_no"
    t.string   "uid_no"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "bank_and_identity_details", ["user_id"], name: "index_bank_and_identity_details_on_user_id", using: :btree

  create_table "employee_details", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "emp_id"
    t.string   "firstname"
    t.string   "lastname"
    t.date     "dob"
    t.date     "date_of_join"
    t.string   "blood_group"
    t.string   "official_email_id"
    t.string   "mobile"
    t.integer  "landline",           limit: 8
    t.text     "current_address"
    t.text     "permanent_address"
    t.string   "skype_id"
    t.string   "personal_email_id"
    t.string   "guardian_full_name"
    t.integer  "guardian_mobile",    limit: 8
    t.integer  "guardian_landline",  limit: 8
    t.text     "guardian_address"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pre_company_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "company_name"
    t.string   "employee_id"
    t.string   "location"
    t.string   "designation"
    t.float    "last_CTC"
    t.text     "Resignation_reason"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "pre_company_details", ["user_id"], name: "index_pre_company_details_on_user_id", using: :btree

  create_table "project_details", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "project_name"
    t.string   "description"
    t.string   "duration"
    t.date     "project_start_date"
    t.date     "project_end_date"
    t.string   "project_type"
    t.string   "team_lead_name"
    t.string   "project_url"
    t.string   "your_role"
    t.string   "technology"
    t.string   "client_name"
    t.string   "company_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "project_details", ["user_id"], name: "index_project_details_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sales_bds", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sales_id"
    t.string   "skype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sales_bds", ["user_id"], name: "index_sales_bds_on_user_id", using: :btree

  create_table "sales_consultants", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.float    "comission"
    t.integer  "contact",         limit: 8
    t.string   "skype_id"
    t.string   "email_id"
    t.string   "location"
    t.string   "address"
    t.integer  "bank_account_no", limit: 8
    t.string   "bank_name"
    t.string   "ifsc_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sales_consultants", ["user_id"], name: "index_sales_consultants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "pwd"
    t.boolean  "soft_delete",            default: false
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "academic_details", "users"
  add_foreign_key "bank_and_identity_details", "users"
  add_foreign_key "pre_company_details", "users"
  add_foreign_key "project_details", "users"
  add_foreign_key "sales_bds", "users"
  add_foreign_key "sales_consultants", "users"
end
