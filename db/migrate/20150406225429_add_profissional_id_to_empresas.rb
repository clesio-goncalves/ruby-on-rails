class AddProfissionalIdToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :profissional_id, :integer
    add_index :empresas, :profissional_id
  end
end
