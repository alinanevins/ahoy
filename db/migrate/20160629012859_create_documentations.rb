class CreateDocumentations < ActiveRecord::Migration
  def change
    create_table :documentations do |t|
      t.integer :user_id
      t.string :name
      t.string :audience
      t.string :link_to_documentation

      t.timestamps null: false
    end
  end
end
