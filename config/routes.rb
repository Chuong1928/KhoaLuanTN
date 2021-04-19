Rails.application.routes.draw do
    get "/" => "home#index"
    
    concern :paginatable do
      get '(page/:page)', action: :index, on: :collection, as: ''
    end
    
    namespace :admin do
      resources :posts ,concerns: :paginatable
      resources :categories
      root "dashboard#index"
    end
    
    devise_for :users
    
end
