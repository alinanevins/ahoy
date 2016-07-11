class AddFacultyNameToConsultations < ActiveRecord::Migration
  def change
    add_column :consultations, :facultyname, :string
  end
end
