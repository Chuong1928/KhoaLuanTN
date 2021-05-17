class AuthorsController < ApplicationController

    def index
        @q = policy_scope(Post).ransack(params[:q])
        # @list_category = @search.result.order(position: :asc)
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)
        
    end
    
    def show
        @q = Post.friendly.ransack(params[:q])
        # @list_category = @search.result.order(position: :asc)
        @posts = @q.result.visible.order(created_at: :desc).page(params[:page]).per(10)
        @user = User.friendly.find(params[:id])
        #@user_test = User.friendly.find(params[:id])
        respond_to do |format|
            format.html # index.html.erb
            format.json { render :json => @user.as_json(
                only: [:email, :name],
                methods: [:id, :default_avatar, :posts_count, :followers_count]
            )}
        end
    end

    def create
        @followe = FriendShip.new(follow_params)
        @followe.follower_id = current_user.id
        if  @followe.save
            # @this_comment = Post.find(@post_id).comments.last
            # @this_user = Post.find(@post_id).comments.last.user
            respond_to do |format|
                #format.js 
                 format.json {render :json => {mes: "Theo dõi thành công thành công" }} # index.html.erb
            end
        end
    end

    def destroy
        @user_del = params[:follow][:followed_id]
        @user = User.friendly.find(params[:id])
        @follow_del = FriendShip.find_by follower_id: current_user.id, followed_id: @user_del
        p @follow_del
        if @follow_del.destroy
            respond_to do |format|
                format.json {render :json => {mes: "Đã hủy theo dõi"}} # index.html.erb
            end
        end
    end

    def follow_params
        params.require(:follow).permit(:followed_id)
    end

end
