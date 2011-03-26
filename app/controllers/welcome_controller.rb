class WelcomeController < ApplicationController

  def index
    @tweets = @user.follow_tweets
  end
  
  def login
    @u = User.new
  end
  
  def login_do
    @user = User.where(params[:user].slice(:user_name)).first
    if @user && @user.password_match?(params[:user][:password])
      session[:user] = @user.id
      flash[:notice] = "Welcome to twitterific"
      redirect_to root_path
    else
      flash[:error] = "Wrong username or password"
      redirect_to login_path
    end
  end
  
  def logout
    session[:user] = nil
    redirect_to root_path
  end
  
  def user
    @u = User.where(:username => params[:user]).first
  end
  
  def follow
    Follow.new(:user => @user, :follow_id => params[:user]).save
    redirect_to root_path
  end
  
  def tweet
    tweet = Tweet.new(:text => params[:tweet][:text], :user => @user).save
    redirect_to root_path
  end
  
  def users
    @users = User.all
  end
  
end
