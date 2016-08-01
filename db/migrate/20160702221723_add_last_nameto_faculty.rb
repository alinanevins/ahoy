class AddLastNametoClient < ActiveRecord::Migration
  def change
    add_column :faculties, :last_name, :string
    rename_column :faculties, :name, :first_name
  end
end
