class AddUserArrayDefaultValue < ActiveRecord::Migration
  def change
    remove_column :consultations, :user_id
    add_column :consultations, :user_id, :integer, array: true, default: []
  end
end
