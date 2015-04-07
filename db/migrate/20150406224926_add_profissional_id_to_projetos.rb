class AddProfissionalIdToProjetos < ActiveRecord::Migration
  def change
    add_column :projetos, :profissional_id, :integer
    add_index :projetos, :profissional_id
  end
end
