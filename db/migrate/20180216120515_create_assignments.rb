class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :subject_id
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
