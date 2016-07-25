class AddNotesToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :notes, :text
  end
end
