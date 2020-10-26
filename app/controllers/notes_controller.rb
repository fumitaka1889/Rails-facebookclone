class NotesController < ApplicationController
  def index
  end
  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def create
    Note.create(note_params)
    redirect_to notes_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :image, :image_cache, :content)
  end
end
