class Movie < ApplicationRecord
  before_validation { self.slug = slugify(self.title) }
  validates :slug, presence: true, uniqueness: true


  def slugify(string)
    string.downcase.sub(' ', '-')
  end

  def to_param
    slug
  end
end
