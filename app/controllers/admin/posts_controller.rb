
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
            @posts = Post.friendly.find(params[:id])
          end

        def new     
            # @search = policy_scope(Post).ransack(params[:q])

            # @posts = @search.result.page(params[:page]).per(5)
            #    //creat,update,destroy,show,index,new,
            @post  = Post.new
            @tags = Tag.all
        end
        
        def create
            @post = Post.new(post_params)
            # @post.title = params[:post][:title]
            # @post.body = params[:post][:body]
            # @post.peralink = params[:post][:peralink]
            # @post.visible = params[:post][:visible]
           

             @post.user_id = current_user.id
            if  @post.save
                # categories = Category.find(params[:post][:category_ids])
                @post.category_ids = params[:post][:category_ids] # = categories
                p params[:post][:tag_ids]
                params[:post][:tag_ids].each do |tag_id|
                    if tag_id != "" &&  Tag.where(id: tag_id).count == 0
                        p tag_id
                        p if tag_id != "" &&  Tag.where(id: tag_id).count
                        @new_tag = Tag.new()
                        @last_tag_id = Tag&.last&.id || 0
                        @new_tag.id = @last_tag_id + 1
                        @new_tag.name = tag_id
                        @new_tag.save
                        @post.category_ids
                        p 'chua vào đây'
                    end
                end

                # @post.tag_ids = params[:post][:tag_ids]
                redirect_to admin_posts_path
            else
                p @post.errors.full_messages
                render :new
            end
        end

        def edit 
            @tags = Tag.all
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
            @tags = Tag.all
            @post = Post.friendly.find params[:id]
            @action = "update"
            authorize @post
            if @post.update(post_params)
                @post.category_ids = params[:post][:category_ids]
                @post.tag_ids = params[:post][:tag_ids]
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
