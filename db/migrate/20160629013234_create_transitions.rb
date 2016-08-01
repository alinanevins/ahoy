class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :course
      t.string :link

      t.timestamps null: false
    end
  end
end
