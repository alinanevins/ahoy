class MakeUserIdAnArrayTryThree < ActiveRecord::Migration
  def change
    change_column :consultations, :user_id, "varchar[] USING (string_to_array(user_id, ','))"
  end
end
