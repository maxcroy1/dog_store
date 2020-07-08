class OrdersController < ApplicationController


    private
    def set_user
        @user = session[:user_id] unless !session[:user_id]
    end
end
