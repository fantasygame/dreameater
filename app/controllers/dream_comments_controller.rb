class DreamCommentsController < ApplicationController
  before_action :set_dream, only: [:new, :index, :show, :edit, :update, :destroy]
  before_action :set_dream_comment, only: [:show, :edit, :update, :destroy]

  def new
    @dream_comment = DreamComment.new
  end

  def create
    @dream_comment = DreamComment.new(dream_comment_params.merge({user_id: current_user.id}))
    @dream = Dream.where(id: dream_comment_params[:dream_id]).first
    respond_to do |format|
      if @dream_comment.save
        format.html { redirect_to @dream_comment.dream, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @dream_comment.dream }
      else
        format.html { render :new }
        format.json { render json: @dream_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  def show
  end

  def edit
    authorize @dream_comment
  end

  def update
    authorize @dream_comment
    respond_to do |format|
      if @dream_comment.update(dream_comment_params)
        format.html { redirect_to @dream_comment.dream, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @dream_comment.dream }
      else
        format.html { render :edit }
        format.json { render json: @dream_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @dream_comment
    @dream_comment.destroy
    respond_to do |format|
      format.html { redirect_to @dream, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def set_dream
    @dream = Dream.where(id: params[:dream_id]).first
  end

  def set_dream_comment
    @dream_comment = DreamComment.where(id: params[:id]).first
  end

  def dream_comment_params
    params.require(:dream_comment).permit(:content, :dream_id)
  end


end
