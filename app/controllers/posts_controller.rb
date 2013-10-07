class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(title: params[:title], body: params[:body])
    redirect_to 'posts/index'
  end
end
