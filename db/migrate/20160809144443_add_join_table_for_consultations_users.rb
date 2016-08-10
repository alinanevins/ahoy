class AddJoinTableForConsultationsUsers < ActiveRecord::Migration
  def change
    create_table :consultations_users, id: false do | t |
      t.belongs_to :user
      t.belongs_to :consultation
    end

    add_index :consultations_users, [:user_id, :consultation_id], unique: true
  end
end
