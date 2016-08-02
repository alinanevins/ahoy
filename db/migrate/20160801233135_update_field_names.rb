class UpdateFieldNames < ActiveRecord::Migration
  def change
    rename_column :consultations, :facultyname, :clientname
    rename_column :consultations, :faculty_id, :client_id
    rename_column :transitions, :facultyname, :clientname
    rename_column :transitions, :faculty_id, :client_id
  end
end
