Rainforest::Application.routes.draw do
  get "reviews/show"
  get "reviews/new"
  get "reviews/edit"
  # delete "/products/:product_id/reviews/:id", to "reviews#destroy", as: "review_delete"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :products do
    resources :reviews, :except => [:index, :show]
  end
  resources :users, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
end
  