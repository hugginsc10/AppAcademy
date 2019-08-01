class PostsController < ApplicationController
  before_action :only_users_post, only: [:edit, :update]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      
      render :edit
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_url  
  end
  
  private
  def post_params
    params.require(:post).permit(:url, :content, :user_id, :title, sub_id: [])
  end
  
  def only_users_post
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Forbidden', status: :forbidden
  end
end