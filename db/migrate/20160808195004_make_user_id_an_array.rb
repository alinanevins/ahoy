class MakeUserIdAnArray < ActiveRecord::Migration
  def change
    change_column :consultations, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
