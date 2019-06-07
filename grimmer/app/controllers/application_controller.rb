class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user

  def index

  end

  #to add users to black list and the post to dumpster
  @users = User.all
  for u in @users
    @posts = Post.where('user_id =?', u.id)
    cuenta = 0
    for p in @posts
      #if p.inappropiates.datecreate > (Time.current - 7.days)
      if p.inappropiates.count >=3
        cuenta += 1
      end
      #end
    end
    if cuenta >= 2
      BlackList.create(user_id: u.id)
      for po in @posts
        if po.inappropiates.count >=3
          DumpList.create(post_id: po.id)
        end
      end
    end
  end



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
