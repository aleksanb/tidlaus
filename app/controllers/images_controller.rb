class ImagesController < ApplicationController
	def index
		@images = Image.all(:order => "created_at DESC")
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.create(params[:image])
		if @image.save
			flash[:success] = "<span class='black'>Success!</span> You submitted an image!".html_safe
            redirect_to @image
		else
			flash.now[:failure] = "<span class='black'>Invalid</span> image data.".html_safe
			render :new
		end
	end

	def edit
		@image = Image.find(params[:id])
	end

	def update
		@image = Image.find(params[:id])
		if @image.update_attributes(params[:image])
			flash[:success] = "<span class='black'>Success!</span> You updated an image!".html_safe
            redirect_to @image
        else
        	flash.now[:failure] = "<span class='black'>Invalid</span> image data.".html_safe
        	render :edit
        end
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		flash[:success] = "<span class='black'>Success!</span> You deleted an image!".html_safe
		redirect_to image_path
	end
end
