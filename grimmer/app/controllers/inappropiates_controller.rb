class InappropiatesController < ApplicationController
  before_action :find_post

  def create
    if already_marked?
      flash[:danger] = "you can't mark as inappropiate more tan once"
    else
      @post.inappropiates.create(user_id: @current_user.id)
    end
    redirect_to  :controller => :posts , :action => :full_post , :id => @post.id
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_marked?
    Inappropiate.where(user_id: @current_user.id, post_id: params[:post_id]).exists?
  end

end
