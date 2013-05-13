class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :timechallenge
end
