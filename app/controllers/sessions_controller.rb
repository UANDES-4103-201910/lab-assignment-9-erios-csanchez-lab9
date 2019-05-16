class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.find_by_email(session_params[:email])
		if user && user.password == session_params[:password]
			session[:current_user_id] = user.id
			cookies["registration_cookie"] = String(user.id)
			flash[:notice] = "User was successfully logged in "
			redirect_to "/users/" + String(user.id)
		else

			flash[:notice] = "Incorrect mail or password"
			redirect_to root_url
		end
	end

	def destroy
		#complete this method
		@_current_user = session[:current_user_id] = nil
		cookies["registration_cookie"] = nil
		redirect_to root_path
	end
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
