# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_223_108_212_035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'doctors', force: :cascade do |t|
    t.string 'name'
    t.string 'title'
    t.string 'biography'
    t.string 'photo'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_doctors_on_name', unique: true
  end

  create_table 'reservations', force: :cascade do |t|
    t.date 'reserve_date'
    t.string 'city'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.bigint 'doctor_id'
    t.index ['doctor_id'], name: 'index_reservations_on_doctor_id'
    t.index ['user_id'], name: 'index_reservations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['name'], name: 'index_users_on_name', unique: true
  end

  add_foreign_key 'reservations', 'doctors'
  add_foreign_key 'reservations', 'users'
end
