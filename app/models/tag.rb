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
  validates_uniqueness_of :name, case_sensitive: false

  before_validation :normalize

  class << self
    # This class is responsible for handling all logic
    # related to normalization - so external classes
    # do not know about this process that name is normalized.
    def find_or_create_by(*args)
      find_params = args[0]
      if find_params[:name]
        find_params[:name] = normalize_name(find_params[:name])
      end

      super
    end

    # place it in one place so it can be used by instance and singleton's (class) methods
    def normalize_name(name)
      name.downcase
    end
  end

  private

  def normalize
    normalize_name
  end

  def normalize_name
    self.name = self.class.normalize_name(name)
  end
end
