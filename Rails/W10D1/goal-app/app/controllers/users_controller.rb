class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      flash[:notice] = "sign in successful"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:email, :password)
    
  end
end
