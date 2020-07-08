class OrdersController < ApplicationController

    def new
        @order = Order.new
        @order.build_user
        @order.build_shipping_info
        @order.build_payment_info
        @order.build_billing_info
    end

    def create
        @order = Order.create(order_params)
        redirect_to order_path
    end

    def show
        @order = Order.find(params[:id])
    end


    private
    def set_user
        @user = session[:user_id] unless !session[:user_id]
    end

    def order_params
        params.require(:order).permit(:total, user_attributes: [:username, :password, :email], billing_info_attributes: [:user_id, :address_one, :address_two, :city, :state, :country, :zip_code], shipping_info_attributes: [:user_id, :address_one, :address_two, :city, :state, :country, :zip_code], payment_info_attributes: [:billing_info_id, :user_id, :name_on_card, :card_number, :expiration, :cvc, :zip_code])
    end
end
