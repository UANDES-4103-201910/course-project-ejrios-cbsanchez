class LocationAdminsController < ApplicationController
  before_action :set_location_admin, only: [:show, :edit, :update, :destroy]

  # GET /location_admins
  # GET /location_admins.json
  def index
    @location_admins = LocationAdmin.all
  end

  # GET /location_admins/1
  # GET /location_admins/1.json
  def show
  end

  # GET /location_admins/new
  def new
    @location_admin = LocationAdmin.new
  end

  # GET /location_admins/1/edit
  def edit
  end

  # POST /location_admins
  # POST /location_admins.json
  def create
    @location_admin = LocationAdmin.new(location_admin_params)

    respond_to do |format|
      if @location_admin.save
        format.html { redirect_to @location_admin, notice: 'Location admin was successfully created.' }
        format.json { render :show, status: :created, location: @location_admin }
      else
        format.html { render :new }
        format.json { render json: @location_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_admins/1
  # PATCH/PUT /location_admins/1.json
  def update
    respond_to do |format|
      if @location_admin.update(location_admin_params)
        format.html { redirect_to @location_admin, notice: 'Location admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_admin }
      else
        format.html { render :edit }
        format.json { render json: @location_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_admins/1
  # DELETE /location_admins/1.json
  def destroy
    @location_admin.destroy
    respond_to do |format|
      format.html { redirect_to location_admins_url, notice: 'Location admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_admin
      @location_admin = LocationAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_admin_params
      params.require(:location_admin).permit(:address, :latitude, :longitude, :adminstrator_id)
    end
end
