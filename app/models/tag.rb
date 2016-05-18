# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  validates_presence_of :name
  validates_length_of :name, minimum: 2
  validates_uniqueness_of :name, case_sensitive: false

  before_validation :handle_name

  class << self
    def find_or_create_by(*args)
      find_params = args[0]
      if find_params[:name]
        find_params[:name] = handle_name(find_params[:name])
      end

      super
    end

    def handle_name(name)
      name.downcase
    end
  end

  def handle_name
    self.name = self.class.handle_name(name)
  end
end
