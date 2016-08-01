class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.integer :client_id
      t.integer :user_id
      t.datetime :date
      t.text :focus
      t.string :link_to_notes

      t.timestamps null: false
    end
  end
end
