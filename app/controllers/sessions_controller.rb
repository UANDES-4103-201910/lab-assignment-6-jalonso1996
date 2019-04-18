class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(email: params[:session][:email],password: params[:session][:password])[0]
		if user != nil
      session[:current_user_id] = user.id
			cookies["log in"] = String(user.id)
      redirect_to "/users/" +String(user.id)
		else
			flash[:notice] = "Incorrect User or Password"
			redirect_to root_path
    end
		#complete this method
	end

	def destroy
		session[:current_user_id] = nil
		cookies["log in"] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
		#complete this method
	end
end
