class SessionsController < ApplicationController
    helper_method :session_create

    def new
    end

    def create
        @user = User.find_by(username: params[:username]) 
        if @user.authenticate(params[:password]) 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:my_errors] = @user.errors.full_messages
            redirect_to new_user_path
        end    
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
