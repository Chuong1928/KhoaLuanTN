
module Admin
    class PostsController < AdminController
        def index     
            #    //creat,update,destroy,show,index,new,
            @posts = Post.all
            @post  = Post.new
            respond_to do |format|
                format.html # index.html.erb
                format.xml  { render xml: @posts }
                format.json { render json: @posts }
            end

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
             @post.views = 0
             @post.save

            redirect_to admin_posts_path
        end

        def edit     
            @posts = Post.find(params[:id])
            
        end

        def  update  
            #    //creat,update,destroy,show,index,new,
            # @posts = Post.find(params[:id])
            @post = Post.find params[:id]
            @post.update(post_params)
            # @post.title = params[:post][:title]
            # @post.body = params[:post][:body]
            # @post.peralink = params[:post][:peralink]
            # @post.visible = params[:post][:visible]
           
             @post.save

            redirect_to admin_posts_path
        end

        def destroy     
            #    //creat,update,destroy,show,index,new,
            @post = Post.find(params[:id])
            @post.destroy

            redirect_to admin_posts_path
        end
        
        def post_params
            params.require(:post).permit(:body, :title, :peralink, :visible)
        end

    end
end
