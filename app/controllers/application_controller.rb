class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #layout proc { google_logged_in ? "google_logged_in" : "application" }
  before_action :authenticate_user!

  def index

  end

  def current_user
	#complete this method
   # @_current_user ||= session[:current_user_id] &&
    #    User.find_by(id: session[:current_user_id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_user_logged_in?
	#complete this method
   logged_in = false
    if session[:current_user_id]
      logged_in = true
    end
	  if logged_in then true else redirect_to root_path end
  end

  #def google_logged_in
  #  if session["warden.user.user.key"] then true else false end
  #end
end
