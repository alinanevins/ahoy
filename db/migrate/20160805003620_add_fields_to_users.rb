class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tot_consultations, :integer
    add_column :users, :tot_documentations, :integer
    add_column :users, :tot_observations, :integer
    add_column :users, :tot_presentations, :integer
    add_column :users, :tot_transitions, :integer
  end
end
