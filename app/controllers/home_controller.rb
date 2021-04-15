class HomeController < ApplicationController
    
    def index
        if user_signed_in?
           @posts_detail = Post.joins(:user)
        end

       
    end
end
