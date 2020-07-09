class ItemsController < ApplicationController
# before_action :set_user 
before_action :set_item, only: [:show, :add_to_cart]
before_action :cart
    def index
        @items = Item.all
    end

    def show
        @order_item = OrderItem.new(quantity: 1)
    end

    def add_to_cart
        @order_item = OrderItem.new(order_item_params)
        item_present = cart.find{|i| i["item"] == @item.id}
        if !item_present
            cart << {item: @item.id, quantity: @order_item.quantity}
        else
            item_present["quantity"] += @order_item.quantity
        end
        session[:cart] = cart
        render :show
    end

    private 
    def set_item
        @item = Item.find(params[:id])
    end

    def order_item_params
        params.require(:order_item).permit(:quantity)
    end
end
