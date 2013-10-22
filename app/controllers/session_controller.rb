class SessionController < ApplicationController
  def new
  end
  def create
    user = User.where(name: params[:name]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :back
    else redirect_to("/login")
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to("/login")
  end
end
