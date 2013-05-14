# == Schema Information
#
# Table name: timechallenges
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  reward        :string(255)
#  deadline      :datetime
#  show_deadline :datetime
#

class Timechallenge < ActiveRecord::Base
  has_many :attending
  has_many :users, :through => :attending, :dependent => :destroy

  validates :title, :reward, :deadline, :show_deadline, :presence => true
  validates :deadline, :date => { :after => Proc.new { Time.zone.now } }
  validates :show_deadline, :date => { :after => :deadline }

end
