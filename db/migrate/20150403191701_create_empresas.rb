class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :cnpj
      t.string :inscricao_estadual
      t.string :nome_empresarial
      t.string :nome_fantasia
      t.integer :grau_risco
      t.string :cnae
      t.text :atividade_principal
      t.string :telefone
      t.string :email
      t.string :cep
      t.string :nome_logradouro
      t.integer :numero_logradouro
      t.string :bairro
      t.string :uf
      t.string :cidade
      t.string :complemento

      t.timestamps
    end

    add_index :empresas, :cnpj, :uniqueness => true
    add_index :empresas, :email, :uniqueness => true
  end
end
