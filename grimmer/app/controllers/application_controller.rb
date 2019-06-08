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
      m = Inappropiate.where('post_id = ?', p.id).first()
      #if m != nil
       # if m.datecreate > (Time.current - 7.days)
          if p.inappropiates.count >=3
            cuenta += 1
          end
        #end
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

  #delete user and post from black list and dumplist after a week
  @black = BlackList.all
  for b in @black
    if b.created_at > (Time.current - 7.days)
      b.destroy
    end
  end
  @dump = DumpList.all
  for d in @dump
    if d.created_at > (Time.current - 7.days)
      d.destroy
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
