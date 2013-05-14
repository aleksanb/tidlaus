class LinksController < ApplicationController 
  #filter_access_to :all
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  def index 
    @title = "Lenkeforlengaren"
    @links = Link.all
    respond_to do |format|
      format.json { render :json => @links }
      format.all { render :index }
    end
  end

  def show
    @title = "Lenkeforlengaren"
    @link = Link.find(params[:id])
    respond_to do |format|
      format.json { render :json => @links }
      format.all { render :show }
    end
  end

  def new
    @title = "Lenkeforlengaren"
    @link = Link.new
    @links = Link.order("created_at DESC").limit(10)
  end

  def create
    @title = "Lenkeforlengaren"
    @link = Link.new(link_params)

    respond_to do |format|
      format.xhr {
        if @link.save!
          render :json => @link
        else 
          render :json => {}
        end
      }
      format.all {
        if @link.save
          flash[:success] = "<span class='black'>Success!</span> You created a long link!".html_safe
          redirect_to @link
        else
          flash.now[:failure] = "<span class='black'>Invalid</span> link data.".html_safe
          render 'new'
        end
      }
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:success] = "<span class='black'>Success!</span> You deleted a link!".html_safe
    redirect_to links_path
  end

  def redirect
    @link = Link.find_by_longurl(params[:id])
    @link.update_attributes!(:views => @link.views+1)
    redirect_to @link.shorturl
  end

  private

    def link_params
      params.require(:link).permit(:shorturl, :length)
    end

end
