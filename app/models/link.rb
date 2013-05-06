# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  shorturl   :string(255)
#  longurl    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  views      :integer          default(0)
#

class Link < ActiveRecord::Base
  attr_accessible :longurl, :shorturl, :length, :views
  attr_accessor :length

  url_regex = /[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,4}(\/\S*)?$/i

  validate :shorturl, :presence => true, 
  						:format => {:with => url_regex}
	validate :length, :presence => true, :on => :create
  before_create :generatelink

  default_scope :order => "created_at DESC"

  def generatelink
    self.shorturl = strip(self.shorturl)
  	self.longurl = dasloop(strip(shorturl)) #obfuscate(strip(shorturl))*length
  end


  private

    def dasloop(url)
      len = self.length.to_i/64
      remainder = self.length.to_i%64
      newurl = ""
      if len > 0
        len.times do |i|
          newurl += obfuscate(url, rand)
        end
      else
        newurl += obfuscate(url, rand);
        newurl = newurl[0,remainder-"https://tidla.us/".length]
      end
      newurl
    end

  	def obfuscate(url,int)
  		secure_hash("#{Time.now.utc}--#{url}--#{int}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end

end
