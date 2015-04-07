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

ActiveRecord::Schema.define(:version => 20150406225429) do

  create_table "elaboracaos", :force => true do |t|
    t.integer  "projeto_id"
    t.integer  "empresa_id"
    t.integer  "profissional_id"
    t.date     "data_elaboracao"
    t.text     "conclusao"
    t.text     "recomendacoes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "elaboracaos", ["empresa_id"], :name => "index_elaboracaos_on_empresa_id"
  add_index "elaboracaos", ["profissional_id"], :name => "index_elaboracaos_on_profissional_id"
  add_index "elaboracaos", ["projeto_id", "empresa_id", "profissional_id", "data_elaboracao"], :name => "profissional_elabora_projeto_empresa_data", :unique => true
  add_index "elaboracaos", ["projeto_id"], :name => "index_elaboracaos_on_projeto_id"

  create_table "empresas", :force => true do |t|
    t.string   "cnpj"
    t.string   "inscricao_estadual"
    t.string   "nome_empresarial"
    t.string   "nome_fantasia"
    t.integer  "grau_risco"
    t.string   "cnae"
    t.text     "atividade_principal"
    t.string   "telefone"
    t.string   "email"
    t.string   "cep"
    t.string   "nome_logradouro"
    t.integer  "numero_logradouro"
    t.string   "bairro"
    t.string   "uf"
    t.string   "cidade"
    t.string   "complemento"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "profissional_id"
  end

  add_index "empresas", ["cnpj"], :name => "index_empresas_on_cnpj"
  add_index "empresas", ["email"], :name => "index_empresas_on_email"
  add_index "empresas", ["profissional_id"], :name => "index_empresas_on_profissional_id"

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
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "profissional_id"
  end

  add_index "projetos", ["nome"], :name => "index_projetos_on_nome"
  add_index "projetos", ["profissional_id"], :name => "index_projetos_on_profissional_id"

end
