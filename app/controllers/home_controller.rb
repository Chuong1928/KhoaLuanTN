class HomeController < ApplicationController
    
    def index
        @all_posts = Post.visible.order(created_at: :desc).page(params[:page]).per(10)

        # @search = policy_scope(Post).ransack(params[:q])

        #     @posts = @search.result.page(params[:page]).per(5)
        @search = policy_scope(Category).ransack(params[:q])
        @categorys = @search.result.order(position: :asc)
        @list_category = @search.result.order(position: :asc)

        @q = policy_scope(Post).ransack(params[:q])
        # @list_category = @search.result.order(position: :asc)
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
            format.js 
        end
    end

 

end
