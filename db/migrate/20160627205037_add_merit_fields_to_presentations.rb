class AddMeritFieldsToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :sash_id, :integer
    add_column :presentations, :level,   :integer, :default => 0
  end
end
