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
  attr_accessor :length

  url_regex = /[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,4}(\/\S*)?$/i

  validate :shorturl, :presence => true, 
  						:format => {:with => url_regex}

  before_save :generatelink
  default_scope :order => "created_at DESC"

  def generatelink
    unless self.shorturl != nil && self.shorturl.to_s.match(/^http:\/\/|https:\/\//) != nil
      self.shorturl = "http://"+self.shorturl.to_s
    else
      self.shorturl = self.shorturl.to_s
    end
  	self.longurl = dasloop(self.shorturl, length.to_i) 
  end

  private

    def dasloop(url, length)
      newurl = ""
      if length == 0
        length = 1
      end

      length.times do |i|
        newurl += obfuscate(url, rand)
      end

      newurl
      #newurl += obfuscate(url, rand)
      #newurl = newurl[0,remainder-"https://tidla.us/".length]
    end

  	def obfuscate(url,int)
  		secure_hash("#{Time.now.utc}--#{url}--#{int}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end

end
