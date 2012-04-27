require 'spec_helper'

describe User do
  describe "Attributes" do

  	before(:each) do
  		@attr = {:name => "aleksanb"}
  	end

  	it "should require a name attribute" do
  		noname = User.new(@attr.merge(:name => ""))
  		noname.should_not be_valid
  	end

  	it "should reject wrong names" do
  		noname = User.new(:name => "bjarEn_29")
  		noname.should_not be_valid
  	end

  	it "should accept correct names" do
  		correctname = User.new(:name => "Ebdsakjdkasjd")
  		correctname.should be_valid
  	end

  end
end
