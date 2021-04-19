class PostController < ApplicationController
    def post
        //creat,update,destroy,show,index,new,
        
    end

    def show
        @posts = Post.find(params[:id])
    end
    
end
