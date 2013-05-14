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
    if timechallenge and ( Time.now >= timechallenge.deadline )
      errors.add(:base, "Denne utfordringen har dessverre begynt og påmelding/avmelding har derfor avsluttet.")
    end
    errors.blank?
  end

  def timechallenge_contains_user
    if user.timechallenges.include? timechallenge
      errors.add(:base, "Du er allerede påmeldt denne utfordringen.")
    end
    errors.blank?
  end

end
