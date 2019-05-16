class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		user = User.new(registrations_params)
		if user.save
			flash[:notice] = "Registration correct"
			redirect_to root_url

		else

			flash[:notice] = "Incorrect registration, try again"
			redirect_to registrations_url
		end
	end
	def registrations_params
		params.require(:registration).permit(:name, :last_name, :email, :password, :phone)
	end
end
