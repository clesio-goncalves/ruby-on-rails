class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.text :descricao
      t.float :valor
      t.integer :validade_anos

      t.timestamps
    end

    add_index :projetos, :nome, :uniqueness => true
  end
end
