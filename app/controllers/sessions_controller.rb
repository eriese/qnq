class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    @graph = Koala::Facebook::API.new(user.oauth_token)
    fb_user = @graph.get_object("me", "fields" =>"username")
    user.photo_url = "https://graph.facebook.com/#{fb_user["username"]}/picture?type=square"
    user.fb_photo_large = "https://graph.facebook.com/#{fb_user["username"]}/picture?type=large"
    user.save
    session[:user_id] = user.id

    redirect_to "/users/#{user.id}"
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
