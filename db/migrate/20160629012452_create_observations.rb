class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.datetime :date
      t.string :school
      t.string :department
      t.integer :presentation_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
