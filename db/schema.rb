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

ActiveRecord::Schema.define(:version => 20111219134723) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "link_to_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author_img_file_name"
    t.string   "author_img_content_type"
    t.integer  "author_img_file_size"
    t.datetime "author_img_updated_at"
  end

  create_table "authors_books", :id => false, :force => true do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "authors_publications", :id => false, :force => true do |t|
    t.integer "author_id"
    t.integer "publication_id"
  end

  create_table "books", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "link_to_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "book_cover_file_name"
    t.string   "book_cover_content_type"
    t.integer  "book_cover_file_size"
    t.datetime "book_cover_updated_at"
  end

  create_table "books_publications", :id => false, :force => true do |t|
    t.integer "book_id"
    t.integer "publication_id"
  end

  create_table "publications", :force => true do |t|
    t.string   "name"
    t.date     "date_of_pub"
    t.integer  "copies"
    t.string   "format"
    t.text     "info"
    t.string   "link_to_img"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["publisher_id"], :name => "index_publications_on_publisher_id"

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.text     "info"
    t.string   "link_to_logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "usr_img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
