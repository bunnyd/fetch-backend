Rails.application.routes.draw do
  resources :owners
  resources :dogs
  resources :meetups
  post '/login', to: 'authentication#create'
  post '/search-dog-park', to: 'owners#searchDogParks'
  post '/search-dog-restaurants', to: 'owners#searchDogRestaurants'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
