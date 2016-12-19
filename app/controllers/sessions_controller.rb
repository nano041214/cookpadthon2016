class SessionsController < ApplicationController
  def index
    if !current_user
      render "new"
    else
      render "logout"
    end
  end

  def create
    user = User.find_by_email params[:email]
    user.authenticate(params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now.alert = "ユーザー名かパスワードに誤りがあります"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
