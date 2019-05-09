class DumpListsController < ApplicationController
  before_action :set_dump_list, only: [:show, :edit, :update, :destroy]

  def dumplist
    @dump_list_all = DumpList.all
  end
  # GET /dump_lists
  # GET /dump_lists.json
  def index
    @dump_lists = DumpList.all
  end

  # GET /dump_lists/1
  # GET /dump_lists/1.json
  def show
  end

  # GET /dump_lists/new
  def new
    @dump_list = DumpList.new
  end

  # GET /dump_lists/1/edit
  def edit
  end

  # POST /dump_lists
  # POST /dump_lists.json
  def create
    @dump_list = DumpList.new(dump_list_params)

    respond_to do |format|
      if @dump_list.save
        format.html { redirect_to @dump_list, notice: 'Dump list was successfully created.' }
        format.json { render :show, status: :created, location: @dump_list }
      else
        format.html { render :new }
        format.json { render json: @dump_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dump_lists/1
  # PATCH/PUT /dump_lists/1.json
  def update
    respond_to do |format|
      if @dump_list.update(dump_list_params)
        format.html { redirect_to @dump_list, notice: 'Dump list was successfully updated.' }
        format.json { render :show, status: :ok, location: @dump_list }
      else
        format.html { render :edit }
        format.json { render json: @dump_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dump_lists/1
  # DELETE /dump_lists/1.json
  def destroy
    @dump_list.destroy
    respond_to do |format|
      format.html { redirect_to dump_lists_url, notice: 'Dump list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dump_list
      @dump_list = DumpList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dump_list_params
      params.require(:dump_list).permit(:post_id)
    end
end
