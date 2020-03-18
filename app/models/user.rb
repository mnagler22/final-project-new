# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  boolean         :string
#  password_digest :string
#  private         :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates(:username,
    {
      :presence => true,
      :uniqueness => { :case_sensitive => false }
    }
  )
  
  has_secure_password

  def own_courses
    return Course.where({ :owner_id => self.id })
  end

  def own_grades
    own_courses = Course.where({ :owner_id => self.id })
    c = own_courses.collect(:grade)
    #a = c.to_s.to_f
    return c
  end
end
