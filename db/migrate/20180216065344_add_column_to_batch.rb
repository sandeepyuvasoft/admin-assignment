class AddColumnToBatch < ActiveRecord::Migration[5.1]
  def change
  	add_column :batches, :course_id, :integer
  end
end
