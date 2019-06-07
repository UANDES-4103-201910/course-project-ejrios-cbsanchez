class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy ]
  before_action :current_user


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def home
    @post_recent = Post.order(created_at: :desc ).limit(20)
    @post_all = Post.all
    @post_comment = Post.all
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  def search_post
    @post_all_search = Post.all
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  def view_post
    @post_all = Post.all
    if params[:id] == nil
      @post = nil
    else
      @post = Post.find(params[:id])
      @comment = Commentary.where("post_id = ?", @post.id)
    end
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  def full_post
    @post_full = Post.find(params[:id])
    @comment = Commentary.where("post_id = ?", @post_full.id)
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  def deletePost

    @post_user = Post.where("user_id = ?", @current_user.id)
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end



  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(post_params)
    @post.user_id = @current_user.id

    respond_to do |format|
      if @post.save
        flash[:success] = "Post was successfully created."
        format.html { redirect_to home_path}
        format.json { render :show, status: :created, location: @post }

      else
        flash[:danger] = "You have errors, try again"
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = 'Post was successfully updated.'
        format.html { redirect_to home_path }
        format.json { render :show, status: :ok, location: @post }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      flash[:success] = 'Post was successfully destroyed.'
      format.html { redirect_to deletePost_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  def commentary_params
    params.require(:commentary).permit(:texto, :country, :city, :user_id, :post_id, :photo, :file, :location)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :user_id, :type_of_post, :country, :city, :photo, :file, :location)
    end
end
