class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to notes_path
    else
      flash.now[:danger] = '入力されたメールアドレスまたはパスワードはアカウントと一致しません。'
      render :new
    end
  end
end
