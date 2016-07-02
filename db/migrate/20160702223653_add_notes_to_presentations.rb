class AddNotesToPresentations < ActiveRecord::Migration
  def change
    add_column :presentations, :notes, :text
    remove_column :presentations, :sash_id, :integer
    remove_column :presentations, :level, :integer
  end
end
