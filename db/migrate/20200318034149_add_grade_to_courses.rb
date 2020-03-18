class AddGradeToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :grade, :float
  end
end
