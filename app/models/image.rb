# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Image < ActiveRecord::Base
	attr_accessible :image, :title, :description

	has_attached_file 	:image,
						:styles => {:medium => "300x300>", :thumb => "100x100>"}

	validate :title, :presence => true
	validate :image, :presence => true

	default_scope :order => "updated_at DESC"
  # attr_accessible :title, :body
end
