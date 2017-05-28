class Rent < ApplicationRecord
  belongs_to :user, foreign_key: :id
  has_many :rent_items
end
