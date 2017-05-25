class Movie < ApplicationRecord
  before_validation { self.slug = slugify(self.title) }
  validates :slug, presence: true, uniqueness: true


  def slugify(string)
    puts "what the fuck"
    string.sub(' ', '-')
  end
end
