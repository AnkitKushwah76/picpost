Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :posts do
    get :my_posts, on: :collection
    resources :comments
  end
end
