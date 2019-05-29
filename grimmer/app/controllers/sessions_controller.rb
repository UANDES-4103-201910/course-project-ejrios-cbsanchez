class SessionsController < ApplicationController
  def LogIn
  end

  def googleAuth
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    user.update_attribute(:last_access_at, Time.current)
    redirect_to home_path
  end

  def create
    #complete this method
    user = User.where(email: session_params[:email]).first
    puts user
    if user && user.password == session_params[:password]
      session[:user_id] = user.id
      user.update_attribute(:last_access_at, Time.current)
      flash[:notice] = "Successful Login"
      redirect_to :home
    else
      flash[:error] = "Invalid credentials"
      redirect_to :LogIn
    end

  end

  def destroy
    #complete this method
    session[:user_id] = nil
    redirect_to :LogIn
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
