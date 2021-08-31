class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless signed_in?
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  helper_method :current_user, :signed_in?
end
