class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
  end

  def create
    # https://github.com/zquestz/omniauth-google-oauth2#auth-hash
    email = request.env.dig('omniauth.auth', 'info', 'email')
    user = User.find_or_create_by(email: email.downcase)
    session[:user_id] = user.id.to_s
    redirect_to cards_path
  end
end
