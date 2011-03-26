class UsersController < ApplicationController
  def new
    @user ||= User.new
    render :action => :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user] = @user
      flash[:notice] = "You have been registered successfully"
      redirect_to root_path
    else
      new
    end
  end
end