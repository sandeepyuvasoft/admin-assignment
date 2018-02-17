class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :code
      t.string :duration

      t.timestamps
    end
  end
end
