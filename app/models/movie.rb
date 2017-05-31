class Movie < ApplicationRecord
  before_save { create_slug }
  before_save { initialize_availability }

  mount_uploader :image, ImageUploader

  has_many :rent_items
  def create_slug
    unless self.title.nil?
      self.slug = self.title.downcase.gsub(' ', '-')
    end
  end

  def initialize_availability
    unless self.available.nil?
      self.available = true
    end
  end

  def to_param
    slug
  end
end
