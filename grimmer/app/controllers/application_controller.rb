class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user ,except: [:LogIn, :new, :usePolicy]

  def index

  end

  #to add users to black list and the post to dumpster
  @users = User.all
  @black = BlackList.all
  @dump = DumpList.all
  for u in @users
    @posts = Post.where('user_id =?', u.id)
    cuenta = 0
    for p in @posts
      m = Inappropiate.where('post_id = ?', p.id).first()
      if m != nil
        #if m.datecreate.hour > (Time.current.hour - 604800)
          if p.inappropiates.count >=3
            cuenta += 1
          end
        #end
      end
    end
    @blackuser = BlackList.where('user_id=?', u.id)
    if cuenta >= 2
      if @blackuser.count >= 1
      else
        BlackList.create(user_id: u.id)
        for po in @posts
          if po.inappropiates.count >=3
            DumpList.create(post_id: po.id)
          end

        end
      end

    end
  end

  #delete user and post from black list and dumplist after a week
  @blackDelete = BlackList.all
  if @blackDelete.nil?
  else
    for b in @blackDelete
      if b.created_at.hour < (Time.current.hour - 604800)
        b.destroy
      end
    end
  end

  @dumpDelete = DumpList.all
  if @dumpDelete.nil?
  else
    for d in @dumpDelete
      if d.created_at.hour < (Time.current.hour - 604800)
        d.destroy
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
