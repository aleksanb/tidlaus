class LinksController < ApplicationController 
  filter_access_to :all

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
    @links = Link.order("created_at DESC").limit(10)
  end

  def create
    @title = "Lenkeforlengaren"
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "<span class='black'>Success!</span> You created a long link!".html_safe
      redirect_to @link
    else
      flash.now[:failure] = "<span class='black'>Invalid</span> link data.".html_safe
      render 'new'
    end
  end

  # def edit
  #     @link = Link.find(params[:id])
  # end

  # def update
  #     @link = Link.find(params[:id])
  #     if @link.update_attributes(params[:link])
  #         flash[:success] = "<span class='black'>Success!</span> You updated a link!".html_safe
  #         redirect_to @link
  #     else
  #         flash.now[:failure] = "<span class='black'>Invalid</span> link.".html_safe
  #         render :edit
  #     end
  # end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    flash[:success] = "<span class='black'>Success!</span> You deleted a link!".html_safe
    redirect_to links_path
  end

  # def pycreate
  #  @link = Link.create(:shorturl => params[:shorturl], :length => params[:length])
  #  if @link.save
  #    render :show, :layout => false
  #  else
  #    redirect_to root_path
  #  end
  #
  # end

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
