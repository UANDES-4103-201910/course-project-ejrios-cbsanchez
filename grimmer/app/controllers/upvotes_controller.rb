class UpvotesController < ApplicationController
  before_action :find_post

  def create
    if already_downvoted?
      flash[:notice] = "you can downvote and upvote the same post"
    else
      if already_upvoted?
        flash[:notice] = "you cant Upvote more tan once"
      else
        @post.upvotes.create(user_id: @current_user.id)
      end
    end

    redirect_to  :controller => :posts , :action => :full_post , :id => @post.id
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_upvoted?
    Upvote.where(user_id: @current_user.id, post_id: params[:post_id]).exists?
  end
  def already_downvoted?
    Downvote.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
