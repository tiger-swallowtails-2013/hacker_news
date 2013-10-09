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
    @post = Post.new(post_params(params))
    if @post.save
      redirect_to "posts#show"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params(params)
    params[:post].permit(:title, :body, :parent_post_id)
  end
end
