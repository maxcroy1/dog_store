class UsersController < ApplicationController
    before_action :cart
    before_action :confirm_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:my_errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
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
