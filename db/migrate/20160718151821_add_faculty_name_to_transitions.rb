class AddFacultyNameToTransitions < ActiveRecord::Migration
  def change
        add_column :transitions, :facultyname, :string
  end
end
