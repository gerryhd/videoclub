class MoviesController < ApplicationController
  def make_a_rent
    render html: "Here is where you'll rent a movie."
  end

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 16)
  end

  def create

  end

  def edit
    @movie = Movie.find_by(slug: params[:slug])
  end

  def update
    @movie = Movie.find_by(slug: params[:slug])
    if @movie.update_attributes(movie_params)
      flash[:success] = "Los datos han sido actualizados."
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def show
    @movie = Movie.find_by(slug: params[:slug])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :description)
  end
end
