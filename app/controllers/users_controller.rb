class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user].permit(:username, :password))
    render "show"
  end

  def show
  end    
end

