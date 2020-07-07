class ApplicationController < ActionController::Base

    helper_method :cart

    def home
    end

    private
    
    def set_user
        @user = User.find_by(params[:sessions][:id])
    end

    def cart
        session[:cart] ||= []
    end
end
