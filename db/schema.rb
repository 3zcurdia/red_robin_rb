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

ActiveRecord::Schema[7.0].define(version: 2022_02_25_171527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "messages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "messaging_service_id", null: false
    t.string "recipient"
    t.text "content"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["messaging_service_id"], name: "index_messages_on_messaging_service_id"
  end

  create_table "messaging_services", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "alias_name"
    t.string "provider", default: "slack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "settings", default: "{}"
    t.index ["provider"], name: "index_messaging_services_on_provider"
  end

  add_foreign_key "messages", "messaging_services"
end
