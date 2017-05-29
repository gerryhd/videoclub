class RentItem < ApplicationRecord
  belongs_to :movie
  belongs_to :rent

  validates :movie_id, uniqueness: {scope: :movie_id}


  def movie_present
    if movie.nil?
      errors.add(:movie, "is not valid.")
    end
  end

  def self.renting?(movie_id, rent_id)
    movie = RentItem.find_by(movie_id: movie_id, rent_id: rent_id)
    if movie
      return true
    else
      return false
    end
  end
end
