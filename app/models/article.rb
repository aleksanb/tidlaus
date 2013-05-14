# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#  html_safe  :boolean
#

class Article < ActiveRecord::Base
	belongs_to :user

	validates :title, :presence => true
	validates :content, :presence => true
	validates :user_id, :presence => true

	default_scope :order => "created_at DESC"

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
