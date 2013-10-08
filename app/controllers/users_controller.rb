class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(params))
    if @user.save
      redirect_to 'users#show'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params(params)
    params[:user].permit(:username, :password, :first_name,:last_name, :email)
  end

end

