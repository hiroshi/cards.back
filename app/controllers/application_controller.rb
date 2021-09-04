class ApplicationController < ActionController::Base
  before_action :require_login

  class ErrorStatus < Exception
    attr_reader :status
    def initialize(status, message: nil)
      @status = status
      @message = message
    end

    def message
      @message || @status
    end
  end

  rescue_from ErrorStatus do |err|
    render plain: err.message, status: err.status
  end

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
