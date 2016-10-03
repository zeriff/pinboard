Rails.application.routes.draw do
  root to: "pins#index"
  resources :pins

  resources :follows, only:[:create, :destroy]
  resources :home
  resources :categories
  devise_for :users

  resources :users do
      member do
        get :show
      end
    end

  get '/pins/filterby/:category_id', to: "pins#filterby", as: "filter"
  post "/pins/add_comment", to: "pins#add_comment"
  post "/pins/get_info", to: "pins#get_info"

  # get 'likes/:id', to: "likes#create", as: :likes
  get 'like/:id', to: "likes#create", as: :likes
  resources :likes, only: [:destroy]
  resources :comments, only: [:create, :destroy]
end
