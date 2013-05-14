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

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
