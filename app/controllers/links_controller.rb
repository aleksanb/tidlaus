class LinksController < ApplicationController

	def index
        @title = "Lenkeforlengaren"
		@links = Link.all
	end

	def show
        @title = "Lenkeforlengaren"
		@link = Link.find_by_longurl(params[:id])
		redirect_to urlhelper(@link)
		#redirect_to #'#{@link.shorturl}'
	end

	def new
        @title = "Lenkeforlengaren"
		@link = Link.new
	end

	def create
        @title = "Lenkeforlengaren"
		@link = Link.create(params[:link])
		if @link.save
			redirect_to root_path, :flash => { :success => "Suksess! Du skapte en lang link: www.tidla.us/#{@link.longurl} Denne gaar til #{urlhelper(@link)}" }
		else
			flash[:failure] = "Feilformatert Link :("
			render 'new'
		end
	end
end
