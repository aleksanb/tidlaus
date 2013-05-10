class ArticlesController < ApplicationController
	filter_access_to :all

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

  def hsf
    @article = Article.find(params[:id])
    @article.html_safe = (@article.html_safe?)? false : true
    if @article.save
      flash.now[:success] = "<span class='black'>Success!</span> The article is now html safe.".html_safe
    else
      flash.now[:failure] = "<span class='black'>Failure</span> Something went wrong..".    html_safe
    end
    render :edit
  end

	def create
		@user = current_user
		@article = @user.articles.create(article_params)
		if @article.save
			flash[:success] = "<span class='black'>Success!</span> You submitted an article!".html_safe
			redirect_to root_path
		else
			flash.now[:failure] = "<span class='black'>Invalid</span> article data.".html_safe
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:success] = "<span class='black'>Success!</span> You updated an article!".html_safe
            redirect_to @article
        else
        	flash.now[:failure] = "<span class='black'>Invalid</span> article content.".html_safe
        	render :edit
        end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:success] = "<span class='black'>Success!</span> You deleted an article!".html_safe
    redirect_to root_path
	end

	private

		def article_params
			params.require(:article).permit(:title, :content)
		end
end
