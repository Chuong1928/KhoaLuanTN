Rails.application.routes.draw do
    get "/index" => "home#index"
      

    namespace :admin do
      resources :posts
      root "dashboard#index"
    end
    
    devise_for :users
  #  devise_for :users
  #  root "static_pages#home"
end
