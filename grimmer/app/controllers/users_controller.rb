class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def search_user
    @user_all =User.all
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end
  def view_user
    @user_all =User.all
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  def intro
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = 'User was successfully created.'
        format.html { redirect_to :LogIn }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:danger] = "There are some mistakes, please try again"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to :controller => :users , :action => :uConfig , :id => @user.id }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:danger] = "There are some mistakes, please try again"
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if session[:user_id] == @user.id
      @user.destroy
      session[:user_id] = nil
      respond_to do |format|
        flash[:success] = 'User was successfully destroyed.'
        format.html { redirect_to :LogIn}
        format.json { head :no_content }
      end
    else
      @user.destroy
      respond_to do |format|
        flash[:success] = 'User was successfully destroyed.'
        format.html { redirect_to view_user_path}
        format.json { head :no_content }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def title

    end
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :country, :city, :biography, :password, :photo, :location)
    end
end
