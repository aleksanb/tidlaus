# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name

  #has_many :exercises, :dependent => :destroy

  #username_regex = /\A[a-z0-9]*\z/i

  validates :name, :presence => true,
  					:uniqueness => {:case_sensitive => false}#,
  					#:format => {:with => username_regex}


  before_save do |user| 
    user.name = user.name.downcase
  end

  def to_param
  	name
  end


  class << self

    def authenticate(name)
      user = find_by_name(name.downcase)
    end

  end

end
