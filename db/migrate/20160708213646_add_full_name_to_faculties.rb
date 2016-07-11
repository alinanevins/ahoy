class AddFullNameToFaculties < ActiveRecord::Migration
  def change
    add_column :faculties, :full_name, :string
  end
end
