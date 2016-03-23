class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy, :like, :unlike]

  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = Dream.all
  end

  # GET /dreams/1
  # GET /dreams/1.json
  def show
  end

  # GET /dreams/new
  def new
    @dream = Dream.new
  end

  # GET /dreams/1/edit
  def edit
    authorize @dream
  end

  # POST /dreams
  # POST /dreams.json
  def create
    @dream = Dream.new(dream_params)
    @dream.user_id = current_user.id

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dreams/1
  # PATCH/PUT /dreams/1.json
  def update
    authorize @dream
    respond_to do |format|
      if @dream.update(dream_params)
        format.html { redirect_to @dream, notice: 'Dream was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream }
      else
        format.html { render :edit }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    authorize @dream
    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url, notice: 'Dream was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @dream.liked_by current_user
    redirect_to :back
  end

  def unlike
    @dream.unliked_by current_user
    redirect_to :back
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dream
      @dream = Dream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dream_params
      params.require(:dream).permit(:title, :content)
    end
end
