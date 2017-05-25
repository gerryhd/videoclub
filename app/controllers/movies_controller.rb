class MoviesController < ApplicationController
  def make_a_rent
    render html: "Here is where you'll rent a movie."
  end

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 16)
  end

  def create

  end

  def update

  end

  def show
    @movie = Movie.find_by(slug: params[:slug])
  end
end
