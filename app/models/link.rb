# == Schema Information
#
# Table name: links
#
#  id         :integer         not null, primary key
#  shorturl   :string(255)
#  longurl    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Link < ActiveRecord::Base
  attr_accessible :longurl, :shorturl


  url_regex = /[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/i

  validates :shorturl, :presence => true, 
  						:format => {:with => url_regex}

  before_save :generatelink


  def generatelink
  	self.longurl = obfuscate(shorturl)
  end


  private
  	def obfuscate(url)
  		secure_hash("#{Time.now.utc}--#{url}")
  	end

	def secure_hash(string)
		Digest::SHA2.hexdigest(string)
	end

end
