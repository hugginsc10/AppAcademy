class SessionsController < ApplicationController
    before_action :redirect
    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user.nil?
            flash.now[:errors] = ["Invalid user"]
        else
            login_user!(user)
            flash[:success] = ["Successfully logged in!"]
            redirect_to cats_url
        end
    end

    def destroy
        logout_user!
        redirect_to cats_url
    end
    def new
        render :new
    end
end