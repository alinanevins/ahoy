class AddFieldsToClient < ActiveRecord::Migration
  def change
    add_column :faculties, :role, :string
    add_column :faculties, :teaching, :string
  end
end
