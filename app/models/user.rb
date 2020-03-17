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
end
