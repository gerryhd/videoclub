class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:make_a_rent]


  helper_method :current_rent
  helper_method :should_it_pass?
  def make_a_rent
    @page = params[:page]
    @movies = Movie.paginate(page: params[:page], per_page: 4)
    @movie = Movie.find_by(slug: params[:slug])

    unless (@movie.nil?)
      @rent = current_rent
      if (RentItem.renting?(@movie.id, current_rent.id))
        flash.now[:info] = "La película ya está en su lista."
      else

        @rent_item = @rent.rent_items.create!(rent_cart: @rent, movie: @movie)

        @rent.save
        flash.now[:success] = "#{@movie.title} fue agregada a su lista."
      end

      session[:rent_id] = @rent.id

    end
    @rent = current_rent
    @rent_cart = current_rent.rent_items
    @movies = Movie.paginate(page: params[:page], per_page: 4)

    respond_to do |format|
      format.html
      format.json
    end
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

  def create
    @movie = Movie.new(new_movie_params)
    if @movie.save
      flash[:success] = "#{@movie.title} ha sido agregada al catálogo."
    else
      flash[:danger] = "Ocurrió un error al intentar agregar la película. Revise los campos."
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

  def confirm_rent

    if should_it_pass?
      @redirect = true
      flash.now[:success] = "Su renta fue concretada satisfactoriamente."
    else
      flash.now[:danger] = "Su renta no pudo ser concreatada porque presenta adeudos en rentas."
    end

  end

  def new
    @movie = Movie.new
  end

  private
    def should_it_pass?
      [true,false].sample
    end
    def current_rent

      if current_user.rent_cart.nil?
        current_user.rent_cart = RentCart.create!(user: current_user)
      end
      current_user.rent_cart
    end

    def movie_params
      params.require(:movie).permit(:title, :year, :description)
    end

    def new_movie_params
      params.require(:movie).permit(:title, :year, :description, :image)
    end
end
