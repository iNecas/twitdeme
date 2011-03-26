class WelcomeController < ApplicationController

  def index
    @tweets = @user.follow_tweets
  end
  
  def login
    @u = User.new
  end
  
  def login_do
    @user = User.where(params[:user]).first
    if @user
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
  
  def register
    @u = session[:new_user]
    @u ||= User.new
  end
  
  def register_do
    @user = User.new(params[:user])
    if @user.save
      session[:user] = @user.id
      session[:new_user] = nil
      redirect_to root_path
    else
      session[:new_user] = @user
      redirect_to register_path
    end
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
