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
#  user_id            :integer
#

class Image < ActiveRecord::Base
	belongs_to :user

	has_attached_file 	:image#, :styles => {:medium => "300x300>", :thumb => "100x100>"}

	validate :title, :presence => true
	validate :image, :presence => true
	validate :user_id, :presence => true
  validates_attachment_content_type :image, :content_type => [ /^image\/(?:jpeg|gif|png|jpg)$/, nil ]
  #validates_attachment_content_type :image, :content_type => %w[image/png image/jpg image/gif image/png]
  #validates_format_of :image, :with => /\.(jpg|gif|bmp|png)\Z/

	default_scope :order => "created_at DESC"
  # attr_accessible :title, :body
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
