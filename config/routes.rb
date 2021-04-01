Rails.application.routes.draw do
    get "/index" => "home#index"
    

    namespace :admin do
      get "/" => "dashboard#index"
      get "/test" => "dashboard#haha"
    end



end
