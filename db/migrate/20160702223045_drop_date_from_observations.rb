class DropDateFromObservations < ActiveRecord::Migration
  def change
    remove_column :observations, :date, :datetime
    remove_column :observations, :school, :string
    remove_column :observations, :department, :string
  end
end
