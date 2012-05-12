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
  attr_accessible :longurl, :shorturl, :length
  attr_accessor :length


  url_regex = /[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/i

  validates :shorturl, :presence => true, 
  						:format => {:with => url_regex}

  before_save :generatelink


  def generatelink
    self.shorturl = strip(self.shorturl)
  	self.longurl = dasloop(strip(shorturl)) #obfuscate(strip(shorturl))*length
  end


  private

    def dasloop(url)
      len = self.length.to_i
      oldurl = strip(url)
      newurl = ""

      len.times do |i|
        newurl += obfuscate(url,i)
      end

      return newurl
    end

    def strip(url)
      if url[0,4]=='www.'
        url = url[4,url.length]
      else
        url
      end
    end

  	def obfuscate(url,int)
  		secure_hash("#{Time.now.utc}--#{url}--#{int}")
  	end

  	def secure_hash(string)
  		Digest::SHA2.hexdigest(string)
  	end

end
