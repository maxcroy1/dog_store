class OrdersController < ApplicationController
    before_action :cart

    def new
        @order = Order.new
        @order.build_user
        @order.build_shipping_info
        @order.build_payment_info
        @order.build_billing_info
        set_user
    end

    def create
        if !session[:user_id]
            @user = User.create(order_params[:user_attributes])
        else 
            @user = User.find(session[:user_id])
        end
        @shipping_info = ShippingInfo.create(order_params[:shipping_info_attributes].merge!(user_id: @user.id))
        @billing_info = BillingInfo.create(order_params[:billing_info_attributes].merge!(user_id: @user.id))
        @payment_info = PaymentInfo.create(order_params[:payment_info_attributes].merge!(user_id: @user.id, billing_info_id: @billing_info.id))
        @order = Order.create(total: order_params[:total], user_id: @user.id, shipping_info_id: @shipping_info.id, billing_info_id: @billing_info.id, payment_info_id: @payment_info.id )
        create_order_items
        redirect_to order_path(@order)
    end

    def show
        @order = Order.find(params[:id])
    end

    private
    def set_user
        @user = User.find(session[:user_id]) unless !session[:user_id]
    end

    def order_params
        params.require(:order).permit(:total, user_attributes: [:username, :password, :email], shipping_info_attributes: [:address_one, :address_two, :city, :state, :country, :zip_code], billing_info_attributes: [:address_one, :address_two, :city, :state, :country, :zip_code], payment_info_attributes: [:name_on_card, :card_number, :expiration, :cvc, :zip_code] )
    end

    def create_order_items
        cart.each do |item|
            OrderItem.create(order_id: @order.id, item_id: item["item"], quantity: item["quantity"])
        end
        session[:cart].clear
    end

end
