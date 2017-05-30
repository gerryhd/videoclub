class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:make_a_rent]


  helper_method :current_rent
  def make_a_rent
    @page = params[:page]
    @movies = Movie.paginate(page: params[:page], per_page: 4)
    @movie = Movie.find_by(slug: params[:slug])

    unless (@movie.nil?)
      @rent = current_rent
      if (RentItem.renting?(@movie.id, current_rent.id))

      else

        @rent_item = @rent.rent_items.create!(rent_cart: @rent, movie: @movie)

        @rent.save
      end

      session[:rent_id] = @rent.id

    end
    @rent = current_rent
    @rent_cart = current_rent.rent_items
    @movies = Movie.paginate(page: params[:page], per_page: 4)
  end

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 16)
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

  def remove_rent_item
    current_rent.rent_items.find_by(movie_id: params[:id]).destroy
    redirect_to make_a_rent_path
  end

  def empty_rents
    current_rent.rent_items.each do |movie|
      movie.destroy
    end

    redirect_to make_a_rent_path

  end

  private
    def current_rent

      if current_user.rent_cart.nil?
        current_user.rent_cart = RentCart.create!(user: current_user)
      end
      current_user.rent_cart
    end

    def movie_params
      params.require(:movie).permit(:title, :year, :description)
    end
end
