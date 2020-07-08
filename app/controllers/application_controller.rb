class ApplicationController < ActionController::Base
    before_action :cart
    helper_method :cart

    def home
    end

    private
    
    # def set_user
    #     @user = User.find_by(params[:sessions][:id]) unless !params[:sessions][:user_id]
    # end

    def cart
        session[:cart] ||= []
    end
end
