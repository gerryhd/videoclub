class Movie < ApplicationRecord
  before_save { create_slug }
  before_save { initialize_availability }
  before_validation { initialize_description }

  validates_presence_of :title, :description, :year

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

  def initialize_description
    self.description ||= "Lorem Ipsum dolor sit amet, consectetur adipiscing elit."
  end
  def to_param
    slug
  end
end
