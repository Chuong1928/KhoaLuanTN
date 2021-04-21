
module Admin
    class PostsController < AdminController
        def index     
            #    //creat,update,destroy,show,index,new,
            @search = policy_scope(Post).ransack(params[:q])

            
            @posts = @search.result.order(created_at: :desc).page(params[:page]).per(5)
            # 
            
            #  @post  = Post.new
            respond_to do |format|
                format.html # index.html.erb
                format.json { render json: @posts }
                format.js 
            end

        end

        def show
            @posts = Post.find(params[:id])
          end

        def new     
            # @search = policy_scope(Post).ransack(params[:q])

            # @posts = @search.result.page(params[:page]).per(5)
            #    //creat,update,destroy,show,index,new,
            @post  = Post.new
            
        end
        
        def create
            @post = Post.new(post_params)
            # @post.title = params[:post][:title]
            # @post.body = params[:post][:body]
            # @post.peralink = params[:post][:peralink]
            # @post.visible = params[:post][:visible]

             @post.user_id = current_user.id
            if  @post.save
                redirect_to admin_posts_path
            else

                render :new
            end
        end

        def edit    
            @search = policy_scope(Post).ransack(params[:q])

            @posts = @search.result.page(params[:page]).per(5)
            
            # @post = Post.find(params[:id]) 
            #find sẽ bắn ra một Exception nếu không có bất kỳ một record nào được tìm thấy -> web bị crash
            @post = Post.friendly.find(params[:id]) 

            authorize @post
        end

        def  update  
            #    //creat,update,destroy,show,index,new,
            # @posts = Post.find(params[:id])
            @post = Post.friendly.find params[:id]
            authorize @post
            if @post.update(post_params)
                # @post.save
                # redirect_to admin_posts_path

                redirect_to admin_posts_path
            else
                
                flash[:alert] = @post.errors.full_messages.join(". ")
                render :edit
            end
           
             

            
        end

        def destroy     
            #    //creat,update,destroy,show,index,new,
            @post = Post.friendly.find(params[:id])
            authorize @post
            @post.destroy
            redirect_to admin_posts_path
        end
        
        def post_params
            params.require(:post).permit(:body, :title, :permalink, :slug, :visible)
        end

    end
end
