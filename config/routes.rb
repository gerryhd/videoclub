Rails.application.routes.draw do
  devise_for :admins
  get '/rent_a_movie/delete', to: 'movies#empty_rents', as: "empty_rents"
  get '/rent_a_movie/confirm', to: 'rents#create', as: "confirm_rent"
  get '/rent_a_movie(/:slug)', to: 'movies#make_a_rent', as: "make_a_rent"
  post '/rent_a_movie', to: 'movies#remove_rent_item', as: "remove"



  devise_scope :user do
    get "/sign_in" => "devise/sessions#new", as: "user_login"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
    get "/sign_out" => "devise/sessions#destroy"

  end

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  resources :movies, param: :slug
end
