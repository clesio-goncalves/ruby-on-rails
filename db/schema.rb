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

ActiveRecord::Schema.define(:version => 20150320222543) do

  create_table "profissionals", :force => true do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "email"
    t.string   "especialidade"
    t.string   "registro"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "profissionals", ["email"], :name => "index_profissionals_on_email"
  add_index "profissionals", ["registro"], :name => "index_profissionals_on_registro"

  create_table "projetos", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.float    "valor"
    t.integer  "validade_anos"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "projetos", ["nome"], :name => "index_projetos_on_nome"

end
