class OrderItemsController < ApplicationController
    before_action :cart

    def index
    end

    def new
        @order_item = OrderItem.new
    end

    def create
    end

end