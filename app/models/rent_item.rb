class RentItem < ApplicationRecord
  belongs_to :movie
  belongs_to :rent_cart

  validates :movie_id, uniqueness: {scope: :movie_id}


  def movie_present
    if movie.nil?
      errors.add(:movie, "is not valid.")
    end
  end

  def self.renting?(movie_id, rent_cart_id)
    movie = RentItem.find_by(movie_id: movie_id, rent_cart_id: rent_cart_id)
    if movie
      return true
    else
      return false
    end
  end
end
