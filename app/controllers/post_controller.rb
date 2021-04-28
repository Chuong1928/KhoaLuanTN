class PostController < ApplicationController
    def index
        
        @q = policy_scope(Post).ransack(params[:q])
        # @list_category = @search.result.order(position: :asc)
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
            format.js 
        end
    end

    def show
        @search = policy_scope(Category).ransack(params[:q])
        @list_category = @search.result.order(position: :asc)
        
        @q = Post.friendly.ransack(params[:q])
        # @list_category = @search.result.order(position: :asc)
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @posts }
            format.js 
        end
        
        @post = Post.friendly.find(params[:id])
        # Post.find(13).comments.count
    end
    def create
        
    end

end
