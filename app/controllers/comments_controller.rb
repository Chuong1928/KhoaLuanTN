class CommentsController < ApplicationController

    def index
        @search = policy_scope(Comment).ransack(params[:q])

        
        @comments = @search.result.order(created_at: :asc).page(params[:page]).per(5)
        # 
        #  @post  = Post.new
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @comments }
            format.js 
        end
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @post = Post.find(params[:post_id])
        if  @comment.save
            # @this_comment = Post.find(@post_id).comments.last
            # @this_user = Post.find(@post_id).comments.last.user
            respond_to do |format|
                format.js 
                # format.json {render :json => {mes: "Gửi bình luận thành công",this_comment: @this_comment, this_user: @this_user }} # index.html.erb
            end
        end
    end

    def destroy
        @comment = Comment.find(params[:comment][:comment_id_del])
        p @comment
        authorize @comment
        if @comment.destroy
            respond_to do |format|

                format.json {render :json => {mes: "Đã xóa bình luận"}} # index.html.erb
            end
        end
    end
    def comment_params
        params.require(:comment).permit(:body, :post_id)
    end
end
