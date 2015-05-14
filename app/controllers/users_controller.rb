class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create]

	if @user.save
		redirect_to(:users, notice: "User was successfully created")
	end 

	private 

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end 
end
