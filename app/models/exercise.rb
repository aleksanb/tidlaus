# == Schema Information
#
# Table name: exercises
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  meta        :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  levert      :boolean
#  ferdig      :boolean
#  ukedag      :integer
#  klokkeslett :integer
#  date        :datetime
#  user_id     :integer
#

class Exercise < ActiveRecord::Base
  attr_accessible :meta, :name, :levert, :ferdig, :ukedag, :klokkeslett, :date

  belongs_to :user

  validates :user_id, :meta, :name, :ukedag, :klokkeslett, :date, :presence => true

	validates :levert, :ferdig, :inclusion => {:in => [true, false]}



end
