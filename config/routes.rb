Rails.application.routes.draw do
    get "/index" => "home#index"
      

    namespace :admin do
      resources :posts
      root "dashboard#index"
    end
    
    devise_for :users
    
end
