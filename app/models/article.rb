# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ApplicationRecord

  has_and_belongs_to_many :tags

  validates_presence_of :title, :content
  validates_length_of :title, minimum: 5

end
