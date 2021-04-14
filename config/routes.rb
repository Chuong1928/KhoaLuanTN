Rails.application.routes.draw do
    get "/index" => "home#index"
      

    namespace :admin do
      resources :posts
      root "dashboard#index"
    end
    
    devise_for :users 
    # devise_scope :users do
    #   get "/u", to: "devise/sessions#index", as: :new_user_session
    # end
    # get "/u" => "devise#index"
  #  devise_for :users
  #  root "static_pages#home"
end
