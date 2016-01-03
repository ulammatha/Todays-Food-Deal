class TwitterUsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  def create
    @user = User.new(twitter_user_params)
    if @user.save
      flash[:notice] = "Successfully authenticated with Twitter account"
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  private
  def twitter_user_params
    params.require(:user).permit(:email, :name, :password, :uid, :provider)
  end

end