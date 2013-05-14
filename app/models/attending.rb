# encoding: UTF-8
# == Schema Information
#
# Table name: attendings
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  timechallenge_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Attending < ActiveRecord::Base
  belongs_to :user
  belongs_to :timechallenge

  validates_presence_of :user_id, :timechallenge_id

  validate :timechallenge_date_passed
  validate :timechallenge_contains_user

  before_destroy :timechallenge_date_passed

  private

  def timechallenge_date_passed
    if timechallenge and ( Time.zone.now >= timechallenge.deadline )
      errors.add(:base, "This timechallenge has allready started, no further participants are accepted.")
    end
    errors.blank?
  end

  def timechallenge_contains_user
    if user.timechallenges.include? timechallenge
      errors.add(:base, "You are allready participating in this timechallenge.")
    end
    errors.blank?
  end

end
