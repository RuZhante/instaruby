class FeedPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.following.exist?
      @posts = Post.where(user_id: current_user.following.pluck(:id)).order(created_at: :desc)
    else
      Post.none
    end

    render 'posts/index'
  end
end
