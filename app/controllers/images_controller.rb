class ImagesController < ApplicationController
	filter_access_to :all

	def index
		@images = Image.all
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = Image.new
	end

	def create
		@user = current_user
		@image = @user.images.create(image_params)
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
		if @image.update_attributes(image_params)
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
		redirect_to images_path
	end

	private 

		def image_params
			params.require(:image).permit(:image, :title, :description)
		end
end
