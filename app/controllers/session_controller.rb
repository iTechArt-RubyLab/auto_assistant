class SessionController < ApplicationController

  def index

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path

    else
      redirect_to login
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
