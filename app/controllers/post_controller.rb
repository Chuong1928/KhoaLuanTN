class PostController < ApplicationController
    def index
        @list_category = @search.result.order(position: :asc)
    end
    def show
        @search = policy_scope(Category).ransack(params[:q])
        @list_category = @search.result.order(position: :asc)
        @post = Post.find(params[:id])
        # Post.find(13).comments.count
    end
end
