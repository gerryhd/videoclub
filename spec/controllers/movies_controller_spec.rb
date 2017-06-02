require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET index" do

    it "renders the index template if " do
      get :index
      expect(response).to render_template ("movies/index")
    end
  end

  describe "GET make_a_rent" do
    context "logged in" do
      login_user
      it "renders the make_a_rent template" do

        get :make_a_rent
        expect(response).to render_template ("movies/make_a_rent")
      end
    end

    context "not logged in" do
      it "redirects to the login page" do

        get :make_a_rent
        expect(response).to redirect_to ("/sign_in")
      end
    end

    context "with a slug in params" do
      login_user
      it "adds to the rent items list" do
        @movie = FactoryGirl.create(:movie)
        get :make_a_rent, params: {:slug => @movie.slug }
        expect(RentItem.renting?(@movie.id, subject.current_user.rent_cart.id)).to be true
      end
    end

  end

  describe  "POST remove_rent_item" do
    context "with a slug in params (movie already in list)" do
      login_user
      it "removes item from the list" do
        @movie = FactoryGirl.create(:movie)
        get :make_a_rent, params: {:slug => @movie.slug }
        post :remove_rent_item, params: {:id => @movie.id}

        expect(RentItem.renting?(@movie.id, subject.current_user.rent_cart.id)).to be false
      end
    end
  end

  describe "GET empty_rents" do
    login_user
    it "removes all items from the list" do

      get :empty_rents
      expect(subject.current_user.rent_cart.rent_items.empty?).to be true
    end
  end


end
