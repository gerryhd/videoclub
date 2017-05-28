class RentItem < ApplicationRecord
  belongs_to :movie
  belongs_to :rent

  validates :movie, uniqueness: true
  validate :movie_present
  validate :rent_present

  def movie_present
    if movie.nil?
      errors.add(:movie, "is not valid.")
    end
  end

  def rent_present
    if rent.nil?
      errors.add(:rent, "is not a valid rent.")
    end
  end
end
