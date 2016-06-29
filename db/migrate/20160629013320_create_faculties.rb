class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :school
      t.string :department
      t.text :notes

      t.timestamps null: false
    end
  end
end
