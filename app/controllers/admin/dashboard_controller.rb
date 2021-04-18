
module Admin
    class DashboardController < AdminController
        def index
            @count_post =  Post.where(user_id: current_user.id).count
            
            @post_of_today = Post.where("created_at >= ? ", Time.zone.now.beginning_of_day).count

            @search = policy_scope(Post).ransack(params[:q])

            @posts = @search.result.page(params[:page]).per(5)
        end
    end    
end