class ApplicationController < ActionController::Base
    layout "front_end"
    before_action :authenticate_user!
    
end
