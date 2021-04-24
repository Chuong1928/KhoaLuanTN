class HomeController < ApplicationController
    
    def index
        @all_posts = Post.visible.order(created_at: :desc).page(params[:page]).per(10)

        # @search = policy_scope(Post).ransack(params[:q])

        #     @posts = @search.result.page(params[:page]).per(5)
        @search = policy_scope(Category).ransack(params[:q])
        @categorys = @search.result.order(position: :asc)
    end

 

end
