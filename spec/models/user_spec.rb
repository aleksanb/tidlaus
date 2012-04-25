# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#

require 'spec_helper'

describe User do

	before(:each) do
		@attr = { :name => "eksempelbruker", :password=>"foobar",
			:password_confirmation => "foobar"}
	end

	it "should create a user when valid attributes are provided" do
		User.create!(@attr)
	end

	it "should require a name" do
		no_name_user = User.new(:name => "")
		no_name_user.should_not be_valid
	end

	it "should only accept valid names" do
		invalid_name_user = User.new(:name => "User herp ) drop Bobby Tables")
		invalid_name_user.should_not be_valid
	end

	it "should reject duplicate users" do
		User.create!(@attr)
		duplicate = User.new(@attr)
		duplicate.should_not be_valid
	end


	describe "passwords" do

		before(:each) do
			@user = User.new(@attr)
		end


		it "should have a password attribute" do
			@user.should respond_to(:password)
		end

		it "should have a password confirmation" do
			@user.should respond_to(:password_confirmation)
		end

	end

	describe "password validations" do
		it "should require a password" do
			User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
		end

		it "should require a matching confirmation" do
			User.new(@attr.merge(:password_confirmation => "invalid")).
			should_not be_valid

		end

		it "should reject short passwords" do
			User.new(@attr.merge(:password => "a"*5, 
								:password_confirmation => "a"*5)).
			should_not be_valid
		end

		it "should reject long passwords" do
			User.new(@attr.merge(:password => "a"*40,
							:password_confirmation => "a"*40)).
			should_not be_valid
		end
	end

	describe "password encryption" do

		before(:each) do
			@user = User.create!(@attr)
		end

		it "should have an encrypted password attribute" do
			@user.should respond_to(:encrypted_password)
		end

		it "should set the encrypted password attribute" do
			@user.encrypted_password.should_not be_blank
		end

		it "should have a salt" do
			@user.should respond_to(:salt)
		end


		describe "has_password? method" do
			
			it "should exist" do
				@user.should respond_to(:has_password?)
			end

			it "should return true if the passwords match" do
				@user.has_password?(@attr[:password]).should be_true
			end

			it "should return false if the passwords don't match" do
				@user.has_password?("invalid").should be_false
			end
		end

		describe "authenticate method" do

			it "should exist" do
				User.should respond_to(:authenticate)
			end


			it "should return nil on username/password mismatch" do
				User.authenticate(@attr[:name], "wrongpass").should be_nil

			end

			it "should return nil for an username with no user" do
				User.authenticate("bar@foo.com", @attr[:password]).should be_nil
			end

			it "should return the user on username/password match" do
				User.authenticate(@attr[:name],@attr[:password]).should == @user
			end
		end

	end

end
