class SessionsController < ApplicationController
  def login
    #Login Form
  end
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
  def login_attempt
  authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
  if authorized_user
    session[:user_id] = authorized_user.id
    flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
    redirect_to(:action => 'home')
  else
    flash[:notice] = "Invalid Username or Password"
    flash[:color]= "invalid"
    render "login"	
  end
end
def authenticate_user
  if session[:user_id]
     # set current user object to @current_user object variable
    @current_user = User.find session[:user_id] 
    return true	
  else
    redirect_to(:controller => 'sessions', :action => 'login')
    return false
  end
end
def show
    @session=Session.find(params[:id])
  end

def save_login_state
  if session[:user_id]
    redirect_to(:controller => 'sessions', :action => 'home')
    return false
  else
    return true
  end
end
def logout
  session[:user_id] = nil
  redirect_to :action => 'login'
end
end