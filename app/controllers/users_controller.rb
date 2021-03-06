class UsersController < ApplicationController
  def show
    if User.find(params[:id])
      @user = User.find(params[:id])
      @login_user = User.find(session[:user_id])
      if @user != @login_user
        graph = Koala::Facebook::API.new(@login_user.oauth_token)
        @mutual = graph.get_connection("me", "mutualfriends/#{@user.uid}")
        @groups = @user.mutual_groups(@login_user)
      end
      @size = "large"
      @flags = @user.flags
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
    if params[:name]
      search = params[:name].downcase
      @results = User.where("name_downcase like ?", "%#{search}%")
      flash.now[:notice] = 'There are no users by that name' if @results == []
    end
    @results ||= []
  end
  def edit
    @user = User.find(session[:user_id])
    @graph = Koala::Facebook::API.new(@user.oauth_token)
    @fb_user = @graph.get_object("me", "fields" =>"name,username")
  end
  def update
    user = User.find(session[:user_id])
    if user.update_attributes(params[:user])
      redirect_to("/users/#{user.id}")
    else redirect_to("/users/#{user.id}/edit")
    end
  end
end
