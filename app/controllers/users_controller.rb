class UsersController < ApplicationController
    before_action :confirm_user, only: [:show, :orders, :edit, :update, :delete]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def login
    end

    def show
    end

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def delete
        @user.delete
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

    def confirm_user
        if !session[:user_id]
            redirect_to new_user_path
        else
            @user = User.find(session[:user_id])
        end
    end

end
