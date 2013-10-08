class UsersController < ApplicationController
 
  def new
    @user = User.new
  end

  def create
    User.create(params[:user].permit(:username, :password, :first_name,
      :last_name, :email))
    @user = User.find_by_email(params[:user][:email])
    redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
  end    
end

