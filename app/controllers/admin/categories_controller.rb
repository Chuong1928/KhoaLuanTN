module Admin
    class CategoriesController < AdminController
        def index
   #    //creat,update,destroy,show,index,new,
            @search = policy_scope(Category).ransack(params[:q])
       
            @list_category = @search.result.page(params[:page]).per(5)
            
            # 
            
            #  @post  = Post.new
            respond_to do |format|
                format.html # index.html.erb
                format.js 
            end
        end
    end    
end