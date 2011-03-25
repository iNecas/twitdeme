class ApplicationController < ActionController::Base

  protect_from_forgery
  
  before_filter :filter_login
    
  def filter_login

    return if ["login", "login_do", "register", "register_do"].include?(params[:action])
    
    @user = User.where(:id => session[:user]).first
    redirect_to(login_path) unless @user
    
  end
  
end
