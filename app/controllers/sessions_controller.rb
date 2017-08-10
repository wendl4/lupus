class SessionsController < ApplicationController

  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:is_admin] = authorized_user.admin
      flash[:notice] = "Vitaj, #{authorized_user.username}"
      redirect_to root_path
    else
      flash[:notice] = "Nesprávne meno alebo heslo"
      flash[:color]= "invalid"
      render "login"	
    end
  end

  def home
  end

  def profile
  end

  def setting
  end
end
