Rails.application.routes.draw do
  get '/rent_a_movie', to: 'movies#make_a_rent'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  resources :movies
end
