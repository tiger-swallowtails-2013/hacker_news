class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    Post.create(params[:post].permit(:title, :body))
    redirect_to posts_path
  end
end
