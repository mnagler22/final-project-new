class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :course_code
      t.string :requirement
      t.integer :grade
      t.integer :owner_id

      t.timestamps
    end
  end
end
