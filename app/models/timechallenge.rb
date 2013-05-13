class Timechallenge < ActiveRecord::Base
  has_many :attending
  has_many :users, :through => :attending
end
