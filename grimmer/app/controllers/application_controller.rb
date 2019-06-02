class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user

  def index

  end

  #def current_user
    #complete this method
    # @_current_user ||= session[:current_user_id] &&
    #    User.find_by(id: session[:current_user_id])
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    elsif session[:admin_id]
      @current_user ||= Adminstrator.find(session[:admin_id])
    elsif session[:super_admin_id]
      @current_user ||= SuperAdmin.find(session[:super_admin_id])
    else
      @current_user = nil
    end
  end

  def is_user_logged_in?
    #complete this method
    logged_in = false
    if session[:current_user_id]
      logged_in = true
    end
    if logged_in then true else redirect_to :LogIn end
  end
end
