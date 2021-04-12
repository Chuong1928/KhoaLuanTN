
module Admin
    class DashboardController < AdminController
        def index
            @count_post = Post.all.count
        end
    end    
end