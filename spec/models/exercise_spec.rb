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

require 'spec_helper'

describe Exercise do

	
	before(:each) do
		@user = Factory(:user)
		@attr = { :levert => false, :ferdig => false, :name => "Digtek",
					:date => Time.now, :meta => 1, :antall => 2}
	end

	/it "should create a new instance with valid attributes" do
		@user.exercises.create!(@attr)
	end/

	describe " it should have the correct attributes available" do

		before(:each) do
			@exercise = @user.exercises.create(@attr)
		end

		it "should respond to its user" do
			@exercise.should respond_to(:user)
		end

		it "should have the right associated user" do
			@exercise.user_id.should == @user.id
			@exercise.user.should == @user
		end
	end

	describe "validations" do

		it "should have a user id" do
			Exercise.new(@attr).should_not be_valid
		end

		it "should require all the applied fields" do
			@user.exercises.build().should_not be_valid
		end
	end
end
