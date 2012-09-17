class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  helper_method :signed_in?

  protected

  def signed_in?
    session[:admin].present?
  end

  def require_login
    unless signed_in?
      session[:return_to] = request.path
      redirect_to login_path, :notice => "Please login."
    end
  end
end
