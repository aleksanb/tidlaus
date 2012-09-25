class LinksController < ApplicationController 
    #layout 'blank', :only => [:show]

    def index 
        @title = "Lenkeforlengaren"
		@links = Link.all

	end

	def show
        @title = "Lenkeforlengaren"
		@link = Link.find(params[:id])
	end

	def new
        @title = "Lenkeforlengaren"
		@link = Link.new
	end

	def create
        @title = "Lenkeforlengaren"
		@link = Link.create(params[:link])
		if @link.save
			redirect_to @link, :flash => { :success => "Suksess! Du skapte en lang link!" }
		else
			flash.now[:failure] = "Feilformatert Link :("
			render 'new'
		end
	end

    def pycreate
        @link = Link.create(:shorturl => params[:shorturl], :length => params[:length])
        if @link.save
          render :show, :layout => false
        else
            redirect_to root_path
        end

    end

    def redirect
        @link = Link.find_by_longurl(params[:id])
        redirect_to urlhelper(@link)
    end

end
