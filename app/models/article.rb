# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255) skal bli text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
	attr_accessible :title, :content

	belongs_to :user

	validates :title, :presence => true
	validates :content, :presence => true
	validates :user_id, :presence => true

	default_scope :order => "created_at DESC"
  # attr_accessible :title, :body
end
