class UsersController < ApplicationController
	
  before_filter :save_login_state, :only => [:new, :create]
  before_filter :authenticate_user, :only => [:index]

  def new
    @user = User.new 
  end

  def index
    @user = User.find(session["user_id"])
  end

  def create
    @user = User.new(params[:user].permit(:username,:email,:password))
    if @user.save
      flash[:notice] = "Úspešne ste sa zaregistrovali"
      flash[:color]= "valid"
    else
      flash[:notice] = "Nesprávne zadané údaje"
      flash[:color]= "invalid"
    end
    redirect_to :login
  end
end
