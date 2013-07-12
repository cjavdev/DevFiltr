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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130704233704) do

  create_table "assessment_attempts", :force => true do |t|
    t.integer  "candidate_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "title"
    t.text     "solution"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "assessment_id"
    t.integer  "example_count"
    t.integer  "failure_count"
    t.integer  "pending_count"
  end

  create_table "assessment_invites", :force => true do |t|
    t.integer  "assessment_id"
    t.string   "email"
    t.boolean  "taken",         :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "assessments", :force => true do |t|
    t.integer  "administrator_id"
    t.integer  "time_limit"
    t.string   "title"
    t.string   "language"
    t.integer  "difficulty"
    t.text     "instructions"
    t.text     "specs"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "skeleton"
  end

  create_table "models", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "reports", :force => true do |t|
    t.text     "html_report"
    t.text     "json_report"
    t.integer  "example_count"
    t.integer  "failure_count"
    t.integer  "pending_count"
    t.integer  "assessment_attempt_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "is_error"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "guest",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
