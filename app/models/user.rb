class User < ApplicationRecord



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  delegate :movies, to: :rent_cart
  has_one :rent_cart, foreign_key: :id


end


