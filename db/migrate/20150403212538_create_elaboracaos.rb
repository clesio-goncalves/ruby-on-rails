class CreateElaboracaos < ActiveRecord::Migration
  def change
    create_table :elaboracaos do |t|
      t.references :projeto
      t.references :empresa
      t.references :profissional
      t.date :data_elaboracao
      t.text :conclusao
      t.text :recomendacoes

      t.timestamps
    end
    add_index :elaboracaos, :projeto_id
    add_index :elaboracaos, :empresa_id
    add_index :elaboracaos, :profissional_id

    add_index :elaboracaos, [:projeto_id, :empresa_id, :profissional_id, :data_elaboracao], 
    :name => 'profissional_elabora_projeto_empresa_data', :unique => true
  end
end
