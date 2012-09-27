class Image < ActiveRecord::Base
	attr_accessible :image, :title, :description

	has_attached_file 	:image,
						:styles => {:medium => "300x300>", :thumb => "100x100>"}

	validate :title, :presence => true
	validate :image, :presence => true

	default_scope :order => "updated_at DESC"
  # attr_accessible :title, :body
end
