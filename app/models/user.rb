class User < ActiveRecord::Base
  attr_accessible :name

  username_regex = /\A[a-z0-9]*\z/i

  validates :name, :presence => true,
  					:format => {:with => username_regex}

end
