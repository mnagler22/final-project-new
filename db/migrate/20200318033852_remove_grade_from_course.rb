class RemoveGradeFromCourse < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :grade
  end
end
