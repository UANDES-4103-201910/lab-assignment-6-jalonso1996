class RegistrationsController < ApplicationController
	def new

	end

	def create
		u = User.new(name: params[:registration][:name], last_name: params[:registration][:last_name],
			email: params[:registration][:email], phone: params[:registration][:phone], password: params[:registration][:password],
		address: params[:registration][:address])
		if u.save
			flash[:notice] = "Successfull registration"
			redirect_to root_path
		else
			flash[:notice] = "Not possible registration"
			redirect_to registration_path
		end
	    #complete this method
	end
end
