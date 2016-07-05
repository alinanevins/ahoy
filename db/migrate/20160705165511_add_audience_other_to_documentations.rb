class AddAudienceOtherToDocumentations < ActiveRecord::Migration
  def change
    add_column :documentations, :audience_other, :string
    add_column :documentations, :summary, :string
  end
end
