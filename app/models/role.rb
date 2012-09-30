# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
	attr_accessible :title
	validates_format_of :title, :with => /^[a-z0-9\_\-]+$/

	has_many :users_roles, :dependent => :destroy
	has_many :users, :through => :users_roles
  # members_roles :title, :body

  	def users
  		User.find(self.users_roles.all.collect(&:user_id))
  	end
end
