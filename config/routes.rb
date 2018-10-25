Rails.application.routes.draw do
  resources :owners
  resources :dogs
  resources :meetups
  post '/login', to: 'authentication#create'
  post '/search-dog-park', to: 'owners#searchDogParks'
  post '/search-dog-restaurants', to: 'owners#searchDogRestaurants'
  post '/search-petfinder-dogs', to: 'owners#searchPetFinderDogs'

  post '/authenticate', to: 'authentication#a'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
