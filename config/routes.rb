Rainforest::Application.routes.draw do
  get "users/new"
  get "users/create"
  resources :products
  resources :users, :only => [:new, :create]
end
  