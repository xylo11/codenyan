Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
  resources :users, only: [:show]
  resource :user_profile, only: [:edit, :update]
  
  resources :posts do
    resources :comments, shallow: true
  end
  
  resources :parks do
    member do
      post :join
      delete :leave
    end
  end
  
  get '/search', to: 'application#search'
end