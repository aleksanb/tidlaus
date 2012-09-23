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

require 'spec_helper'

describe Link do

	describe "attributes" do

		before(:each) do
			@attr = {:shorturl => "www.fyl.la"}
		end

		it "should respond to stuff" do
			link = Link.new
			link.should respond_to(:shorturl)
			link.should respond_to(:longurl)
		end

		it "should require a short url" do
			link = Link.new
			link.should_not be_valid
		end

		it "should require a valid short url" do
			link = Link.new(:shorturl => "www.derh")
			link.should_not be_valid
		end

		it "should accept valid short urls" do
			link = Link.new(:shorturl => "tidla.us")
			link.should be_valid
		end

		it "should generate a long url" do
			link = Link.create(@attr)
			link.longurl.should_not be_nil
		end

	end

end


