class RenamePasswordOnProfissionals < ActiveRecord::Migration
  def change
    rename_column :profissionals, :senha, :password_digest
  end
end