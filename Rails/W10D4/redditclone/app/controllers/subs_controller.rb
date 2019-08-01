class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end
  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  def index
    @subs = Sub.all
  end
  def edit
    @sub = Sub.find(params[:id])
  end
  
  def update
    @sub = Sub.find_by(sub_params)
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
  end

  private 
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
