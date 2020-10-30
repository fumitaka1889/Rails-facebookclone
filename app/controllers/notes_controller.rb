class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :update, :show, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def confirm
    @note = Note.new(note_params)
    @note = current_user.notes.build(note_params)
    render :new if @note.invalid?
  end

  def create
    @note = Note.new(note_params)
    @note = current_user.notes.build(note_params)
    if params[:back]
      render :new
    else
      if @note.save
        redirect_to notes_path, notice:"投稿完了！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice:"編集完了！"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @note.destroy
    redirect_to notes_path, notice:"投稿を削除しました！"
  end

  private
  def note_params
    params.require(:note).permit(:title, :image, :image_cache, :content)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
