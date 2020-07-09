class OrderItemsController < ApplicationController
    before_action :cart

    def new
        @order_item = OrderItem.new
    end

    def create
    end

end