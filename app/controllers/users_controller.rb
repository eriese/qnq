class UsersController < ApplicationController
  def index
    user = User.where(name: params[:name]).first
    redirect_to "/users/#{user.id}"
  end
  def show
    if User.find(params[:id])
      @user = User.find(params[:id])
      if params[:id] == session[:user_id]
        @edit_button = true
      end
    else
      render :search
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(@user)
    else
      render :new
    end
  end
  def search
    @results = User.where(name: params[:name])
    @results ||= []
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      redirect_to("/users/#{user.id}")
    else redirect_to("/users/#{user.id}/edit")
    end
  end
end
