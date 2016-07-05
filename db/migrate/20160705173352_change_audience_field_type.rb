class ChangeAudienceFieldType < ActiveRecord::Migration
  def change
    change_column :documentations, :audience, "varchar[] USING (string_to_array(audience, ','))"

  end
end
