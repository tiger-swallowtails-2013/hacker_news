class UsersController < ApplicationController
  def new
    @user = User.create
    p @user
    # @user = User.create(params[:user].permit(:username, :password))
  end
end

