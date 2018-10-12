Rails.application.routes.draw do
  resources :owners
  resources :dogs
  resources :meetups
  post '/login', to: 'authentication#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
