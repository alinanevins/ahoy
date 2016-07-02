class AddDateToTransitions < ActiveRecord::Migration
  def change
    add_column :transitions, :date, :datetime
  end
end
