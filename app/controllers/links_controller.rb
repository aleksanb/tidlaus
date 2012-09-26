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
			flash[:success] = "<span class='black'>Success!</span> You created a long link!".html_safe
            redirect_to @link
		else
			flash.now[:failure] = "<span class='black'>Invalid</span> link data.".html_safe
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
        logger.debug "link har naa x views"
        logger.debug @link.views
        @link.update_attributes!(:views => @link.views+1)
        logger.debug "naa skal den ha +1, altsaa"
        logger.debug @link.views
        redirect_to urlhelper(@link)
    end

end
