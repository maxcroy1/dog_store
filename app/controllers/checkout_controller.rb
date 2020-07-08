class CheckoutController < ApplicationController
before_action :set_user

    def user_select
        if !params[:sessions][:id]
            @user = User.new
        else
            redirect_to '/checkout/billing_info'
        end
    end

    def create_user
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to '/checkout/billing_info'
    end

    def billing_info
    end

    def create_billing_info
    end

    def shipping_info
    end

    def create_shipping_info
    end

    def preview_order
    end

    def create_preview_order
    end

    def payment
    end

    def create_payment
    end

    def confirmation
    end

    def create_confirmation
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end
    
end
