class ApplicationController < ActionController::Base
    before_action :cart
    helper_method :cart

    def home
    end

    private
    def cart
        session[:cart] ||= []
    end

end
