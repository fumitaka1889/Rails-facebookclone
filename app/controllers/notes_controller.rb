class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :show, :destroy]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    Note.create(note_params)
    redirect_to notes_path, notice:"画像を投稿しました！"
  end

  def edit
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
