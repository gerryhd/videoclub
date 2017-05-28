class Movie < ApplicationRecord
  before_save { create_slug }

  has_many :rent_items
  def create_slug
    unless self.title.nil?
      self.slug = self.title.downcase.sub(' ', '-')
    end
  end

  def to_param
    slug
  end
end
