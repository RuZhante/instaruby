class PostsController < ApplicationController
  include Pundit

  before_action :load_user
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to user_post_path(@user, @post), flash: { success: "Post was added" }
    else
      render :new, flash: { alert: "Some error occured" }
    end  
  end

  def edit
    @post = @user.posts.find(params[:id])
    authorize @post
  end

  def update
    @post = @user.posts.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post), flash: { success: "Post was updated" }
    else
      render :edit, flash: { alert: "Some error occured" }
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to user_posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end

    def load_user
      @user = User.find(params[:user_id])
    end
end
