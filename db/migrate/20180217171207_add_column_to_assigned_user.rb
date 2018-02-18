class AddColumnToAssignedUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :assigned_users, :status, :string
  end
end
