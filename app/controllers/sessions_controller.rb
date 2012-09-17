class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
  end
  
  def create
    salt = "74f4008ed0d24b0cab290405015cf8c40a234c3a8290c2004afa3ecb8b691a293b1a33d9ccdd944d" * 20
    if Digest::SHA1.hexdigest(params[:session][:password] + salt) == "a00eaad69a0b115a956b53903b3856c5463cb0e8"
      session[:admin] = true
      redirect_to session.delete(:return_to) || root_url, :notice => "Welcome in, beautiful person!"
    else
      flash.now[:alert] = "Incorrect password."
      render :new
    end
  end
  
  def destroy
    session.delete(:admin)
  end
end

