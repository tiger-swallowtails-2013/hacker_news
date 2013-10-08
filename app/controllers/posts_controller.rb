class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post =  Post.new
  end

  def create
    @post = Post.new(post_params(params))
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show # 'posts/:id'
    @post = Post.find(params[:id])
  end

  private

  def post_params(params)
    p params
    params[:post].permit(:title, :body)
  end
end
