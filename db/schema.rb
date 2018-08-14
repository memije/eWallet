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

ActiveRecord::Schema.define(version: 2018_08_14_183428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_transactions", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "transaction_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_transactions_on_card_id"
    t.index ["transaction_history_id"], name: "index_card_transactions_on_transaction_history_id"
  end

  create_table "card_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_number"
    t.date "expiration_date"
    t.bigint "card_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customers_id"
    t.string "security_token"
    t.index ["card_type_id"], name: "index_cards_on_card_type_id"
    t.index ["customers_id"], name: "index_cards_on_customers_id"
  end

  create_table "customer_wallets", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_wallets_on_customer_id"
    t.index ["wallet_id"], name: "index_customer_wallets_on_wallet_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_customers_on_wallet_id"
  end

  create_table "transaction_histories", force: :cascade do |t|
    t.boolean "complete"
    t.decimal "amount"
    t.decimal "porcentual_comission"
    t.decimal "fixed_comission"
    t.bigint "wallet_id"
    t.bigint "transaction_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_type_id"], name: "index_transaction_histories_on_transaction_type_id"
    t.index ["wallet_id"], name: "index_transaction_histories_on_wallet_id"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.bigint "wallet_id"
    t.bigint "transaction_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_history_id"], name: "index_wallet_transactions_on_transaction_history_id"
    t.index ["wallet_id"], name: "index_wallet_transactions_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "card_transactions", "cards"
  add_foreign_key "card_transactions", "transaction_histories"
  add_foreign_key "cards", "card_types"
  add_foreign_key "cards", "customers", column: "customers_id"
  add_foreign_key "customer_wallets", "customers"
  add_foreign_key "customer_wallets", "wallets"
  add_foreign_key "customers", "wallets"
  add_foreign_key "transaction_histories", "transaction_types"
  add_foreign_key "transaction_histories", "wallets"
  add_foreign_key "wallet_transactions", "transaction_histories"
  add_foreign_key "wallet_transactions", "wallets"
end
