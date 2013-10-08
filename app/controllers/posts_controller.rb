class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if params[:yield] == "comment"
      @view = "comment"
    else
      @view = "post"
    end
  end

  def create
    Post.create(params[:post].permit(:title, :body, :parent_post_id))
    redirect_to posts_path
  end
end
