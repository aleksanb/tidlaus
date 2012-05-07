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
#  antall      :integer
#

class Exercise < ActiveRecord::Base
  	attr_accessible :meta, :name, :levert, :ferdig, :ukedag, :klokkeslett, :date, :antall

  	belongs_to :user
  	/
  	validates :user_id, :meta, :name, :ukedag, :klokkeslett, :date, :antall, :presence => true
	validates :levert, :ferdig, :inclusion => {:in => [true, false]}
	/
	before_save :fixshit

	Ukedager = ["Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lordag", "Sondag"]
	Klokkeslett = [8, 9, 10,12,13,14,15,16,17,18,19,20,21,22,23,24]
	AntallOvinger = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	Metatag = ["Hver uke", "Annen hver uke", "Annen hver uke, +1 offset"]

	private

		def fixshit
			self.levert = false
			self.ferdig = false
			self.date = Time.now
		end

end

