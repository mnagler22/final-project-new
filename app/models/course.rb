# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_code :integer
#  course_name :string
#  grade       :float
#  requirement :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#

class Course < ApplicationRecord
end
