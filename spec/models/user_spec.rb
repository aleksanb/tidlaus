# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

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

    describe "tests with the exercises" do
      
      before(:each) do
        @user = User.create(@attr)
       # @ex1 = Factory(:exercise, :user => @user)
       # @ex2 = Factory(:exercise, :user => @user)
      end

      it "should have a exercises attribute" do
        @user.should respond_to(:exercises)
      end

      it "should destroy associated exercises" do
        @user.destroy
        lambda do
          Exercise.find(@ex1)
        end.should raise_error(ActiveRecord::RecordNotFound)
      end


      describe "exercises feed" do

        it "should have a feed" do
          @user.should respond_to(:exercise_feed)
        end

/        it "should include the users exercises" do
          @user.exercise_feed.should include(@ex1)
        end

        it "shouldn't show a different user's exercises" do
          ex2 = Factory(:exercise, :user => Factory(:user, :name => "derper"))
          @user.exercise_feed.should_not include(ex2)
        end
/
      end

    end
  end
end