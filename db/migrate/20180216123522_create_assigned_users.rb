class CreateAssignedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :assigned_users do |t|
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
