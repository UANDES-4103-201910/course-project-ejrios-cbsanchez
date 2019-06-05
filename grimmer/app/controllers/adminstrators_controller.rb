class AdminstratorsController < ApplicationController
  before_action :set_adminstrator, only: [:show, :edit, :update, :destroy]

  # GET /adminstrators
  # GET /adminstrators.json
  def index
    @adminstrators = Adminstrator.all
  end

  # GET /adminstrators/1
  # GET /adminstrators/1.json
  def show
  end

  # GET /adminstrators/new
  def new
    @adminstrator = Adminstrator.new
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  # GET /adminstrators/1/edit
  def edit
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end
  
  def modify_admin
    @admin_all = Adminstrator.all
    if params[:id] == nil
      @admin = blank?
    else
      @admin = Adminstrator.find(params[:id])
    end
    if @current_user.nil?
      redirect_to  :LogIn
    end
  end

  # POST /adminstrators
  # POST /adminstrators.json
  def create
    @adminstrator = Adminstrator.new(adminstrator_params)

    respond_to do |format|
      if @adminstrator.save
        flash[:success] = 'Adminstrator was successfully created.'
        format.html { redirect_to home_admin_path }
        format.json { render :show, status: :created, location: @adminstrator }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :new }
        format.json { render json: @adminstrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminstrators/1
  # PATCH/PUT /adminstrators/1.json
  def update
    respond_to do |format|
      if @adminstrator.update(adminstrator_params)
        flash[:success] = 'Adminstrator was successfully updated.'
        format.html { redirect_to modify_admin_path }
        format.json { render :show, status: :ok, location: @adminstrator }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :edit }
        format.json { render json: @adminstrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminstrators/1
  # DELETE /adminstrators/1.json
  def destroy
    @adminstrator.destroy
    respond_to do |format|
      flash[:success] = 'Adminstrator was successfully destroyed.'
      format.html { redirect_to modify_admin_path}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminstrator
      @adminstrator = Adminstrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adminstrator_params
      params.require(:adminstrator).permit(:name, :password, :nickname, :email, :country, :city)
    end
end
