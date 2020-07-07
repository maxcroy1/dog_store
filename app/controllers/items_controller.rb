class ItemsController < ApplicationController
before_action :set_user 
before_action :set_item, only: [:show, :add_to_cart]
    def index
        @items = Item.all
    end

    def show
    end

    def food
        @items = Item.select {|i| i.category == "Food"}
    end

    def toy
        @items = Item.select {|i| i.category == "Toy"}
    end

    def care
        @items = Item.select {|i| i.category == "Care"}
    end

    def accessories
        @items = Item.select {|i| i.category == "Accessories"}
    end

    def add_to_cart
        cart << @item.id
        session[:cart] = cart
        render :show
    end

    private 

    def set_item
        @item = Item.find(params[:id])
    end

end
