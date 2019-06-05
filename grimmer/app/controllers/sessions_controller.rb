class SessionsController < ApplicationController
  def LogIn

  end

  def googleAuth
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    user.update_attribute(:last_access_at, Time.current)
    flash[:success] = "Successful Login"
    redirect_to home_path
  end

  def create
    #complete this method
    user = User.where(email: session_params[:email]).first
    admin = Adminstrator.where(email: session_params[:email]).first
    sadmin = SuperAdmin.where(email: session_params[:email]).first
    puts user
    puts admin
    puts sadmin
    if admin.nil? && sadmin.nil?
      if user && user.password == session_params[:password]
        session[:user_id] = user.id
        user.update_attribute(:last_access_at, Time.current)
        flash[:success] = "Successful Login"
        redirect_to :home
      else
        flash[:danger] = "Invalid credentials"
        redirect_to :LogIn
      end
    elsif user.nil? && sadmin.nil?
      if admin && admin.password == session_params[:password]
        session[:admin_id] = admin.id
        admin.update_attribute(:last_access_at, Time.current)
        flash[:success] = "Successful Login"
        redirect_to :home_admin
      else
        flash[:danger] = "Invalid credentials"
        redirect_to :LogIn
      end
    else
      if sadmin && sadmin.password == session_params[:password]
        session[:super_admin_id] = sadmin.id
        sadmin.update_attribute(:last_access_at, Time.current)
        flash[:success] = "Successful Login"
        redirect_to :home_admin
      else
        flash[:danger] = "Invalid credentials"
        redirect_to :LogIn
      end
    end


  end

  def destroy
    #complete this method
    session[:user_id] = nil
    session[:admin_id] = nil
    session[:super_admin_id] = nil

    redirect_to :LogIn
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
