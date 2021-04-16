class HomeController < ApplicationController
    
    def index
        @all_posts = Post.visible.order(created_at: :desc)
    end
end
