Rails.application.routes.draw do
  devise_for :admins
  get '/rent_a_movie', to: 'movies#make_a_rent'

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new", as: "user_login"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"

  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  resources :movies, param: :slug
end
