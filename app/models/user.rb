# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
	attr_accessor :password
  attr_accessible :name, :password, :password_confirmation

  username_regex = /\A[a-z]*\z/

  validates :name, 	:presence => true, 
  					:uniqueness => :true,
  					:format => { :with => username_regex }

  validates :password, :presence => true, 
  						:confirmation => true,
  						:length => {:within => 6..39}

end
