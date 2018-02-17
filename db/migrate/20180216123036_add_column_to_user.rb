class AddColumnToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :course_id, :integer
  	add_column :users, :batch_id, :integer
  end
end
