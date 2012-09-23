require 'spec_helper'

describe LinksController do

	describe "GET 'SHOW'" do

		before(:each) do
			@link = Link.create!(:shorturl=>"fyl.la")
		end

		#it "should be successfull" do
		#	get :show, :id => @link
		#	response.should be_success
		#end

		#it "should redirect to the shortlink" do
		#	get :show, :id => @link
		#	response.should redirect_to("www.#{@link.longurl}")
		#end

		#Hvordan skl dette testes?

		it "should have a tag to remove instant redirects"



	end

	describe 'get NEW' do

		it "should have http success" do
			get :new
			response.should be_success
		end

		it "should have the right title" do
			#kanskje en gang selecotr fungerer ikke nå
		end
	end

	describe 'post CREATE' do

		describe "failure" do

			before(:each) do
				@attr = {:shorturl => "butcocks"}
			end

			it "should render the new page" do
				post :create, :link => @attr
				response.should render_template('new')
			end

			it "should give the user a failure flash" do
				post :create, :link => @attr 
				flash[:failure].should =~ /feilformatert link/i
			end

			it "should not create a link" do
				lambda do
					post :create, :user => @attr
				end.should_not change(User, :count)
			end
		end
	end

	describe "Success" do

		before(:each) do
			@attr = {:shorturl => "fyl.la"}
		end

		it "should create a link" do
			lambda do
				post :create, :link => @attr
			end.should change(Link, :count).by(1)
		end

		it "should flash result" do
			post :create, :link => @attr
			flash[:success].should =~ /Suksess/i #får faen meg ikke testa for om url'en er i flashen
		end

		it "should redirect to the new link page" do
			post :create, :link => @attr
			response.should redirect_to(new_link_path)
		end
	end
end
