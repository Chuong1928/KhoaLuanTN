module Admin
    class CommentsController < AdminController
        def index
            @search = policy_scope(Comment).ransack(params[:q])

            
            @comments = @search.result.order(created_at: :desc).page(params[:page]).per(5)
            # 
            
            #  @post  = Post.new
            respond_to do |format|
                format.html # index.html.erb
                format.json { render json: @comments }
                format.js 
            end
        end
        def edit    
            @search = policy_scope(Comment).ransack(params[:q])
    
            @comments = @search.result.page(params[:page]).per(5)
            
            # @post = Post.find(params[:id]) 
            #find sẽ bắn ra một Exception nếu không có bất kỳ một record nào được tìm thấy -> web bị crash
            @comment = Comment.friendly.find(params[:id])
           
            authorize @comment
        end
    
        def  update  
            #    //creat,update,destroy,show,index,new,
            # @posts = Post.find(params[:id])
            @comment = Comment.friendly.find(params[:id])
            @action = "update"
            authorize @comment
            if @comment.update(post_params)
                # @post.save
                # redirect_to admin_posts_path
                redirect_to admin_comment_path
            else
                flash[:alert] = @post.errors.full_messages.join(". ")
                render :edit
            end 
        end
    
        def destroy     
            #    //creat,update,destroy,show,index,new,
            @comment = Comment.friendly.find(params[:id])
            authorize @comment
            @comment.destroy
            redirect_to admin_comment_path
        end
        
        def post_params
            params.require(:comment).permit(:body)
        end
    end

  
end