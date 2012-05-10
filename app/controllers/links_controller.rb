class LinksController < ApplicationController

	def index
		@links = Link.all
	end

	def show
		@link = Link.find_by_longurl(params[:id])
		redirect_to urlhelper(@link)
		#redirect_to #'#{@link.shorturl}'
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.create(params[:link])
		if @link.save
			redirect_to new_link_path, :flash => { :success => "Suksess! Du skapte en lang link: www.tidla.us/#{@link.longurl} Denne gaar til #{@link.shorturl}" }
		else
			flash[:failure] = "Feilformatert Link :("
			render 'new'
		end
	end
end
