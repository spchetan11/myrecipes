class LoginsController < ApplicationController

	def new
		
	end

	def create
		chef = Chef.find_by(email: params[:email])
		session[:id] = chef.id
		if chef && chef.authenticate(params[:password])
          flash[:success] = "You are logged in"
          redirect_to recipes_path
		else
          flash.now[:danger] = "Your email address of password doesn't match"
          redirect_to :back
		end
	end

	def destroy
		session[:id] = nil
		flash[:success] = "Your have logged out"
		redirect_to root_path
	end

end
