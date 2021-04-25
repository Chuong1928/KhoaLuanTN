Rails.application.routes.draw do
    get "/" => "home#index"
    
    concern :paginatable do
      get '(page/:page)', action: :index, on: :collection, as: ''
    end
    
    namespace :admin do
      resources :posts ,concerns: :paginatable
      resources :categories do
        collection do
          post :update_position
        end
      end
      resources :comments
      resources :users do 
        collection do
          get :edit_password
          get :edit_profile
        end
      end

      root "dashboard#index"
    end
    
    devise_for :users
    
    resources :post

end
