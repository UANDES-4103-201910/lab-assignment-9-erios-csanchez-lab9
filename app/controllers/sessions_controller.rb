class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.where(email: session_params[:email]).first
		puts user
		if user && user.password == session_params[:password]
			session[:user_id] = user.id
			flash[:notice] = "Successful Login"
			redirect_to users_path
		else
			flash[:error] = "incorrect email or password"
			redirect_to root_url
		end

	end

	def destroy
		#complete this method
		session[:user_id] = nil
		flash[:error] = "your session has ended"
		redirect_to root_url
	end

	def session_params
		params.require(:session).permit(:email, :password)
	end


end
