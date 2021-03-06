class DreamsController < ApplicationController
  before_action :set_dream, only: [:show, :edit, :update, :destroy, :like_toggle]

  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = Dream.visible(current_user).order(created_at: :desc)
  end

  def stalked
    followed_users = current_user.all_following
    @dreams = Dream.where(user: followed_users).order(created_at: :desc)
    render :index
  end

  def my_dreams
    @dreams = current_user.dreams.order(created_at: :desc)
    render :index
  end

  def top
    @dreams = Dream.visible(current_user).sort_by { |dream| -dream.get_likes.size }
    render :index
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
        format.html { redirect_to @dream, notice: "Dream was successfully created." }
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
        format.html { redirect_to @dream, notice: "Dream was successfully updated." }
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
      format.html { redirect_to dreams_url, notice: "Dream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like_toggle
    if @dream.get_likes.find_by(voter_id: current_user.id).present?
      @dream.unliked_by current_user
    else
      @dream.liked_by current_user
    end
    redirect_to :back
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dream
    @dream = Dream.find(params[:id]).decorate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dream_params
    params.require(:dream).permit(:title, :content, :hidden)
  end
end
