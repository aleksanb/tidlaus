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

  before_save :generatelink
  default_scope :order => "created_at DESC"

  def generatelink
    self.shorturl = self.shorturl.to_s
  	self.longurl = dasloop(shorturl.to_s, length.to_i) 
  end

  private

    def dasloop(url, length)
      newurl = ""
      if length == 0
        puts "\n\n"
        length = 1
        puts "dammit, something failed, setting length to 1: " + length.to_s
      else
        puts "nothing failed, length is: " + length.to_s
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
