class MakeUserIdString < ActiveRecord::Migration
  def change
    change_column :consultations, :user_id, :string
  end
end
