class HomeController < ApplicationController
    
    def index

        @search = policy_scope(Category).ransack(params[:q])
        @categorys = @search.result.order(position: :asc)
        @list_category = @search.result.order(position: :asc)

        @q = Post.ransack(params[:q])
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)

        
        respond_to do |format|
            format.html # index.html.erb
            format.js 
        end
    end

 

end
