
module Admin
    class PostsController < AdminController
        def index     
            #    //creat,update,destroy,show,index,new,
            @posts = Post.all
        end

        def show
            @posts = Post.find(params[:id])
          end

        def new     
            #    //creat,update,destroy,show,index,new,
        end
        
        def create
            respond_to :js, :json, :html
            
            @posts= Post.new();
            respond_with @posts
            
            #    //creat,update,destroy,show,index,new,
        end

        def edit     
            @posts_edit = Post.find(params[:id])
        end

        def  update  
            #    //creat,update,destroy,show,index,new,
        end

        def destroy     
            #    //creat,update,destroy,show,index,new,
        end
        
    end
end
