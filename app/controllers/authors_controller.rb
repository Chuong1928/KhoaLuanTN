class AuthorsController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
        respond_to do |format|
            format.json { render :json => @user.as_json(
                only: [:email, :name],
                methods: [:id, :default_avatar, :posts_count, :followers_count]
            )}
        end
    end
end
