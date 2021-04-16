
module Admin
    class DashboardController < AdminController
        def index
            @count_post =  Post.count
            @post_of_today = Post.where("created_at >= ? ", Time.zone.now.beginning_of_day).count
        end
    end    
end