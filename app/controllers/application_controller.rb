class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  protect_from_forgery

  def create_user_session(user)
    session[:user_id] = user.id
  end

  def destroy_user_session
    
    session[:user_id] = nil
  end

end
