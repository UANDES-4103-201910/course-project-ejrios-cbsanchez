class BlackListsController < ApplicationController
  before_action :set_black_list, only: [:show, :edit, :update, :destroy]

  # GET /black_lists
  # GET /black_lists.json
  def index
    @black_lists = BlackList.all
  end
 def blacklist
   @black_list1 = BlackList.all
   if @current_user.nil?
     redirect_to  :LogIn
   end
 end
  # GET /black_lists/1
  # GET /black_lists/1.json
  def show
  end

  # GET /black_lists/new
  def new
    @black_list = BlackList.new
  end

  # GET /black_lists/1/edit
  def edit
  end

  # POST /black_lists
  # POST /black_lists.json
  def create
    @black_list = BlackList.new(black_list_params)

    respond_to do |format|
      if @black_list.save
        flash[:success] = 'Black list was successfully created.'
        format.html { redirect_to blacklist_path}
        format.json { render :show, status: :created, location: @black_list }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :new }
        format.json { render json: @black_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /black_lists/1
  # PATCH/PUT /black_lists/1.json
  def update
    respond_to do |format|
      if @black_list.update(black_list_params)
        flash[:success] = 'Black list was successfully updated.'
        format.html { redirect_to @black_list}
        format.json { render :show, status: :ok, location: @black_list }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :edit }
        format.json { render json: @black_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /black_lists/1
  # DELETE /black_lists/1.json
  def destroy
    @black_list.destroy
    respond_to do |format|
      flash[:success] = 'Black list was successfully destroyed.'
      format.html { redirect_to blacklist_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_black_list
      @black_list = BlackList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def black_list_params
      params.require(:black_list).permit(:user_id)
    end
end
