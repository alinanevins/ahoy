class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.datetime :date
      t.string :school
      t.string :department
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
