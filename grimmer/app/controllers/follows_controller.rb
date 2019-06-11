class FollowsController < ApplicationController
  before_action :find_post
  def create
    if already_followed?
      flash[:danger] = "You can't follow a post more than once"
    else
      @post.follows.create(user_id: @current_user.id)
    end
    redirect_to  :controller => :posts , :action => :full_post , :id => @post.id
  end
  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_followed?
    Follow.where(user_id: @current_user.id, post_id: params[:post_id]).exists?
  end
end
