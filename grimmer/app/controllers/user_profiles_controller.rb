class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end


  def update_user
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to home_admin_path }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def Profile
    if params[:id] == nil
      @user = @current_user
      @post_user = Post.where("user_id =?", @current_user.id)
    else
      @user = User.find(params[:id])
      @post_user = Post.where("user_id =?", @user.id)
    end

    if @current_user.nil?
      redirect_to  :LogIn
    end
  end
  def Admin_user_profile
    @user = User.find(params[:id])
    @post_user = Post.where("user_id =?", @user.id)
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        flash[:success] = 'User profile was successfully created.'
        format.html { redirect_to @user_profile}
        format.json { render :show, status: :created, location: @user_profile }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      flash[:success] = 'User was successfully destroyed.'
      format.html { redirect_to view_user_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:user_id, :post_id)
    end
end
