
module Admin
    class PostsController < AdminController
        def index     
            #    //creat,update,destroy,show,index,new,
            @posts = Post.all
            @post  = Post.new
        end

        def show
            @posts = Post.find(params[:id])
          end

        def new     
            #    //creat,update,destroy,show,index,new,
            @post  = Post.new
        end
        
        def create
            @post = Post.new(post_params())
            # @post.title = params[:post][:title]
            # @post.body = params[:post][:body]
            # @post.peralink = params[:post][:peralink]
            # @post.visible = params[:post][:visible]
           
             @post.save

            redirect_to admin_posts_path
        end

        def edit     
            @posts = Post.find(params[:id])
        end

        def  update  
            #    //creat,update,destroy,show,index,new,
        end

        def destroy     
            #    //creat,update,destroy,show,index,new,
        end
        
        def post_params
            params.require(:post).permit(:body, :title, :peralink, :visible)
        end
    end
end
