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

	def create
		@user = current_user
		@article = @user.articles.create(params[:article])
		if @article.save
			flash[:success] = "<span class='black'>Success!</span> You submitted an article!".html_safe
			redirect_to root_path
		else
			flash.now[:failure] = "<span class='black'>Invalid</span> image data.".html_safe
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
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

end
