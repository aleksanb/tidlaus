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

  has_many :exercises, :dependent => :destroy

  username_regex = /\A[a-z0-9]*\z/i

  validates :name, :presence => true,
  					:uniqueness => {:case_sensitive => false},
  					:format => {:with => username_regex}


  before_save { |user| user.name = user.name.downcase }

  def to_param
  	name
  end

  def exercise_feed
  	Exercise.where("user_id = ?", id)
  end

end
