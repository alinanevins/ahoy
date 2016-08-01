class RenameClientToClient < ActiveRecord::Migration
  def change
    rename_table :faculties, :clients
  end
end
