class UsersController < ApplicationController
    before_action :set_user, only:[:show, :edit, :update, :delete]

    def new
    end

    def create
    end

    def orders
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :email)
    end

end
