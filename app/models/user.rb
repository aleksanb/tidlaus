# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  salt       :string
#  encrypted_password :string
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :password, :password_confirmation, :email

  #has_many :exercises, :dependent => :destroy

  #username_regex = /\A[a-z0-9]*\z/i

  validates :name, :presence => true, :length => {:maximum => 50},
  					:uniqueness => {:case_sensitive => false}#,
  					#:format => {:with => username_regex}
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}
  validates :email, :presence => true


  before_save do |user|
    user.name.downcase!
    user.email.downcase!
    encrypt_password
  end

  def to_param
  	name
  end

  def has_password?(user_password)
    encrypted_password == encrypt(user_password)
  end

  class << self

    def authenticate(name,password)
      user = find_by_name(name.downcase)
      (user && user.has_password?(password))? user : nil
    end

  end

  private 
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
