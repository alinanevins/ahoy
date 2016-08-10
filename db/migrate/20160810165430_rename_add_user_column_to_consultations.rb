class RenameAddUserColumnToConsultations < ActiveRecord::Migration
  def change
    rename_column :consultations, :user_id, :user_id_old
    add_column :consultations, :user_id, :integer, array: true
  end
end
