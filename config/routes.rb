Rails.application.routes.draw do
    get "/index" => "home#index"
      

    namespace :admin do
      get "/" => "dashboard#index"
      get "/test" => "dashboard#haha"
    end
    
    devise_for :users
  #  devise_for :users
  #  root "static_pages#home"
end
