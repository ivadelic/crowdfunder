class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:index, :new, :create]

	def new

		@user = User.new

	end

	def create

		@user = User.new(user_params)
		if @user.save
			redirect_to projects_url, notice: "Signed Up & Logged In!"
			auto_login(@user)
		else
			render "new", alert: "There was an error! Try again"
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end



	private 

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end 
end
