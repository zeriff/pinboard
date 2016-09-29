Rails.application.routes.draw do
  devise_for :users
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end
  root to: "pins#index"
  post "/pins/add_comment", to: "pins#add_comment"
  post "/pins/get_info", to: "pins#get_info"
end
