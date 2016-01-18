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

ActiveRecord::Schema.define(version: 20160118220142) do

  create_table "clients", force: :cascade do |t|
    t.string   "company_name"
    t.string   "cnpj"
    t.string   "contact_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.integer  "address_number"
    t.string   "aditional_address_detail"
    t.string   "zipcode"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "fantasy_name"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "term"
    t.date     "initial_date"
    t.date     "deadline"
    t.float    "total_price"
    t.string   "delivery_address"
    t.string   "responsable"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "client_id"
  end

  add_index "contracts", ["client_id"], name: "index_contracts_on_client_id"

  create_table "contracts_tools", force: :cascade do |t|
    t.integer "contract_id"
    t.integer "tool_id"
  end

  add_index "contracts_tools", ["contract_id"], name: "index_contracts_tools_on_contract_id"

  create_table "prices", force: :cascade do |t|
    t.decimal  "price"
    t.string   "tools_group"
    t.integer  "deadline"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tools", force: :cascade do |t|
    t.text     "description"
    t.string   "serial_number"
    t.string   "tools_group"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

end
