class AddFieldsToTransitions < ActiveRecord::Migration
  def change
    add_column :transitions, :tools, :string, array: true
    add_column :transitions, :subject, :string
    add_column :transitions, :course_number, :string
    add_column :transitions, :term, :string
    add_column :transitions, :client_role, :string
    add_column :transitions, :link_to_prev_course, :string
    rename_column :transitions, :link, :link_to_new_course
  end
end
