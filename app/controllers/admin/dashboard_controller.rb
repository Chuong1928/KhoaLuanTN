
module Admin
    class DashboardController < AdminController
        def haha
            @count_post = Category.all.count
        end
    end    
end