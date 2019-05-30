class CommentariesController < ApplicationController
  before_action :set_commentary, only: [:show, :edit, :update, :destroy]

  # GET /commentaries
  # GET /commentaries.json
  def index
    @commentaries = Commentary.all
  end

  # GET /commentaries/1
  # GET /commentaries/1.json
  def show
  end

  # GET /commentaries/new
  def new
    @commentary = Commentary.new
  end

  # GET /commentaries/1/edit
  def edit
  end


  # POST /commentaries
  # POST /commentaries.json
  def create
    @commentary = Commentary.create(commentary_params)
    @commentary.user_id = @current_user.id
    @commentary.post_id = @post.id

    respond_to do |format|
      if @commentary.save
        flash[:success] = 'Commentary was successfully created.'
        format.html { redirect_to home_path}
        format.json { render :show, status: :created, location: @commentary }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :new }
        format.json { render json: @commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commentaries/1
  # PATCH/PUT /commentaries/1.json
  def update
    respond_to do |format|
      if @commentary.update(commentary_params)
        flash[:success] = 'Commentary was successfully updated.'
        format.html { redirect_to @commentary}
        format.json { render :show, status: :ok, location: @commentary }
      else
        flash[:danger] = "You have errors, try again"
        format.html { render :edit }
        format.json { render json: @commentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaries/1
  # DELETE /commentaries/1.json
  def destroy
    @commentary.destroy
    respond_to do |format|
      flash[:success] = 'Commentary was successfully destroyed.'
      format.html { redirect_to commentaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentary
      @commentary = Commentary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentary_params
      params.require(:commentary).permit(:texto, :country, :city, :user_id, :post_id, :photo, :file, :location)
    end
end
