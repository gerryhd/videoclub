class MoviesController < ApplicationController
  before_action :authenticate_user!, only: [:make_a_rent, :remove_rent_item, :empty_rents,
                                            :confirm_rent,]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update]


  helper_method :current_rent
  helper_method :should_it_pass?
  helper_method :clean_movie_list

  def make_a_rent
    @page = params[:page]
    @movies = Movie.order('created_at').paginate(page: params[:page], per_page: 4)
    @movie = Movie.find_by(slug: params[:slug])

    unless (@movie.nil?)
      @rent = current_rent
      if (RentItem.renting?(@movie.id, current_rent.id))
        flash.now[:info] = 'La película ya está en su lista.'
      else

        @rent_item = @rent.rent_items.create!(rent_cart: @rent, movie: @movie)

        @rent.save
        flash.now[:success] = "#{@movie.title} fue agregada a su lista."
      end
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
    @movies = Movie.order('created_at').paginate(page: params[:page], per_page: 16)
  end

  def edit
    @movie = Movie.find_by(slug: params[:slug])
  end

  def update
    @movie = Movie.find_by(slug: params[:slug])
    movie_params.each do |key, value|
      unless movie_params[key].to_s.empty?
        @movie.update_attribute(key, value)
      else
        byebug
      end
    end

    redirect_to @movie

  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:success] = "#{@movie.title} ha sido agregada al catálogo."
      redirect_to movies_path

    else
      flash[:danger] = "Ocurrió un error al crear la película. Intente más tarde."
      redirect_to new_movie_path
    end
  end

  def show
    @movie = Movie.find_by(slug: params[:slug])
  end

  def remove_rent_item
    if(RentItem.renting?(params[:id], current_rent.id))
      current_rent.rent_items.find_by(movie_id: params[:id]).destroy

    else
      flash[:danger] = "Error: La película no se encuentra en su lista de renta."

    end
    redirect_to make_a_rent_path
  end

  def empty_rents
    clean_movie_list

    redirect_to make_a_rent_path

  end

  def confirm_rent

    if should_it_pass?
      @redirect = true

      clean_movie_list

      flash.now[:success] = "Su renta fue concretada satisfactoriamente."
    else
      flash.now[:danger] = "Su renta no pudo ser concreatada porque presenta adeudos en rentas."
    end

  end

  def new
    @movie = Movie.new
  end

  private

    def clean_movie_list
      current_rent.rent_items.each do |movie|
        movie.destroy
      end
    end
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
      params.require(:movie).permit(:title, :year, :description, :image)
    end

end
