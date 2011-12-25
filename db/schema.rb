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

ActiveRecord::Schema.define(:version => 20111224230520) do

  create_table "cart_products", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "amount",                                   :default => 0
    t.decimal  "price_old",  :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "price_now",  :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_products", ["cart_id"], :name => "index_cart_products_on_cart_id"
  add_index "cart_products", ["product_id"], :name => "index_cart_products_on_product_id"

  create_table "carts", :force => true do |t|
    t.integer  "amount",                                        :default => 0
    t.decimal  "total_price_old", :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "total_price_now", :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "text"
    t.decimal  "price_now",        :precision => 8, :scale => 2, :default => 0.0
    t.decimal  "price_old",        :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "is_hidden",                                      :default => true
    t.boolean  "is_special",                                     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

end
