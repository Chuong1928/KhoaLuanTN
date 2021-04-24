
module Admin
    class UsersController < AdminController
        def index     
            #    //creat,update,destroy,show,index,new,
            @search = policy_scope(User).ransack(params[:q])

            
            @users = @search.result.order(created_at: :desc).page(params[:page]).per(5)
            
             @user = User.find(current_user.id)
            # 
            
            #  @post  = Post.new
            respond_to do |format|
                format.html # index.html.erb
                format.json { render json: @posts }
                format.js 
            end

        end

        def show
            @user = User.find(params[:id])
          end

    end    
end