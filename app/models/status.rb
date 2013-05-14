# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Status < ActiveRecord::Base
  has_many :users
  validates_presence_of :status
end
