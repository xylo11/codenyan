Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
  resource :user_profile, only: [:edit, :update]
  resources :posts, only: [:new, :create, :show]
  resources :parks do
    member do
      post :join
      delete :leave
    end
  end
  get '/search', to: 'application#search'
end
