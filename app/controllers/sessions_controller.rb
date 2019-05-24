class SessionsController < ApplicationController
	def new
		if current_user
			redirect_to current_user
		end
	end

	def create
		#complete this method
		user = User.where(email: session_params[:email]).first
		puts user
		if user && user.password == session_params[:password]
			# Save the user ID in the session so it can be used in
			# subsequent requests
			session[:current_user_id] = user.id
			flash[:notice] = "Successful Login"
			redirect_to user
		else
			flash[:error] = "Invalid"
			redirect_to root_url
		end

	end

	def destroy
		#complete this method
		@current_user = session[:current_user_id] = nil
		session["warden.user.user.key"][0][0] = 0
		redirect_to root_url
	end

	def session_params
		params.require(:session).permit(:email, :password)
	end

	#def google_logged_in
	#	if session["warden.user.user.key"] then true else false end
	#end

end
