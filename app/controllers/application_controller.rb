class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected 
  def authenticate_user
	if session[:user_id]
	  @current_user = User.find session[:user_id] 
	  return true	
	else
	  redirect_to(:controller => 'sessions', :action => 'login')
	  return false
    end
  end

  def authenticate_admin
    if session[:is_admin] == 'yes'
      return true
    else
      redirect_to root_path
      return false
    end
  end
  
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'home', :action => 'index')
      return false
	else
	  return true
	end
  end
end
