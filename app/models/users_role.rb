# == Schema Information
#
# Table name: users_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersRole < ActiveRecord::Base
	#daarlig stil?
	attr_accessible :user_id
	attr_accessible :role_id

	validates_presence_of :user_id
	validates_presence_of :role_id

	#validates_associated :user
 	#validates_associated :role

	belongs_to :user
	belongs_to :role
  # attr_accessible :title, :body
end
