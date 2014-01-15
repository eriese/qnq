class FlagsController < ApplicationController
  def new
    @flagged_user = User.find(params[:user_id])
    @user = User.find(session[:user_id])
    @flag = Flag.new(flagged_user: @flagged_user, flagger: @user)
  end
  def create
    @flag = Flag.new(params[:flag])
    @user = User.find(params[:user_id])
    @flag.flagged_user = @user.id
    @flag.flagger = session[:user_id]
    @flag.familiarity = @flag.get_familiarity(@user)
    if @flag.save
      redirect_to user_path(@user)
    else
      redirect_to new_user_flag_path(@user)
    end
  end
  def index
    @user = User.find(params[:user_id])
    @flags = Flag.where(flagged_user: @user)
  end
end
