class MakeRolesAnArray < ActiveRecord::Migration
  def change
    change_column :clients, :role, "varchar[] USING (string_to_array(role, ','))"
  end
end
