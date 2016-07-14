class AddFacultynameToTransitions < ActiveRecord::Migration
  def change
    add_column :transitions, :facultyname, :string
  end
end
