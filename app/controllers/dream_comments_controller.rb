class DreamCommentsController < ApplicationController
  before_action :set_dream, only: [:new, :create, :index, :show, :edit, :update]
  before_action :set_dream_comment, only: [:show, :edit, :update, :destroy]

  def new
    @dream_comment = DreamComment.new
  end

  def create
    @dream.dream_comments.build(dream_comment_parrams.merge({user_id: current_user.id}))
    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @dream }
      else
        format.html { render :new }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def set_dream
    @dream = Dream.where(id: params[:dream_id]).first
  end

  def set_dream_comment
    @dream_comment = DreamComment.where(id: params[:id])
  end

  def dream_comment_parrams
    params.require(:dream_comment).permit(:content)
  end


end
