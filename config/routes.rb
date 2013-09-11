Rainforest::Application.routes.draw do
  get "reviews/show"
  get "reviews/new"
  get "reviews/edit"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :products do
    resources :reviews, :except => [:index]
  end
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
end
  