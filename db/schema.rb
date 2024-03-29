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

ActiveRecord::Schema.define(:version => 20111023175322) do

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "page_id"
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "section_image_file_name"
    t.string   "section_image_content_type"
    t.integer  "section_image_file_size"
    t.datetime "section_image_updated_at"
  end

  add_index "sections", ["page_id"], :name => "index_sections_on_page_id"

  create_table "sites", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "domain"
    t.date     "departs_on"
    t.string   "depart_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
