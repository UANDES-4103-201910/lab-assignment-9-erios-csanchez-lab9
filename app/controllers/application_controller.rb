class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def index

  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def is_user_logged_in?
	#complete this method
   logged_in = false
    if session[:current_user_id]
      logged_in = true
    end
	  if logged_in then true else redirect_to root_path end
  end


end
