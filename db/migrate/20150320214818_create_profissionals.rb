class CreateProfissionals < ActiveRecord::Migration
  def change
    create_table :profissionals do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :especialidade
      t.string :registro
      t.string :senha

      t.timestamps
    end

    add_index :profissionals, :email, :uniqueness => true
    add_index :profissionals, :registro, :uniqueness => true
  end
end
