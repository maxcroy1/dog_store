class OrderItemsController < ApplicationController
    before_action :cart

    def index
    end

    def new
        @order_item = OrderItem.new
    end

    def clear_cart
        cart.clear
        render :index
    end

    def delete
        @order_item = OrderItem.find(params[:id])
        redirect_to order_items_path
    end

    def create
    end

end