# == Schema Information
#
# Table name: exercises
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  meta       :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  levert     :boolean
#  ferdig     :boolean
#  date       :datetime
#  user_id    :integer
#  antall     :integer
#

class Exercise < ActiveRecord::Base
  	attr_accessible :meta, :name, :levert, :ferdig, :date, :antall

  	belongs_to :user
  	
  	validates :user_id, :meta, :name, :date, :antall, :presence => true
	validates :levert, :ferdig, :inclusion => {:in => [true, false]}
	
	before_save :fixshit

	AntallOvinger = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	Metatag = ["Hver uke", "Annen hver uke", "Annen hver uke, +1 offset"]

	private

		def fixshit
			self.levert = false
			self.ferdig = false
		end

end

