# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  salt               :string(255)
#  encrypted_password :string(255)
#  email              :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  has_and_belongs_to_many :roles, :uniq => true
  has_many :images
  has_many :articles

  has_many :attending
  has_many :timechallenge, :through => :attending

  #username_regex = /\A[a-z0-9]*\z/i

  validates :name, :presence => true, :length => {:maximum => 50}
            #:format => {:with => username_regex}
  #validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}, :on => :create

  default_scope :order => "created_at DESC"

  before_create do |user|
    #encrypt_password
  end

  before_save do |user|
    user.name.downcase!
    #user.email.downcase!
  end

  def self.create_from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def role_symbols
    (roles || []).map { |r| r.title.to_sym} + [:user]
  end

  def has_password?(user_password)
    encrypted_password == encrypt(user_password)
  end

  class << self

    def authenticate(userhash)
      user = find_by_name(userhash[:name].downcase)
      (user && user.has_password?(userhash[:password]))? user : nil
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
