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

 	before_save :encrypt_password

 	def has_password?(submitted_password)
 		self.encrypted_password == encrypt(submitted_password)
 	end

 	class << self
	 	def authenticate(name, submitted_password)
	 		user = find_by_name(name)
	 		return nil if user.nil?
	 		return user if user.has_password?(submitted_password)
	 	end
	 end

 	private

 		def encrypt_password
 			self.salt = make_salt if new_record?
 			self.encrypted_password = encrypt(self.password)
 		end

 		def encrypt(string)
 			secure_hash("#{salt}--#{string}")
 		end

 		def make_salt
 			secure_hash("#{Time.now.utc}--#{password}")
 		end

 		def secure_hash(string)
 			Digest::SHA2.hexdigest(string)
 		end

end
