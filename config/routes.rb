Rails.application.routes.draw do
  get 'meetups/index'
  get 'meetups/show'
  get 'meetups/edit'
  get 'meetups/new'
  get 'dogs/index'
  get 'dogs/show'
  get 'dogs/new'
  get 'dogs/edit'
  get 'owners/index'
  get 'owners/show'
  get 'owners/new'
  get 'owners/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
