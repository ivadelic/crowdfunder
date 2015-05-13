class ProjectsController < ApplicationController

	def index
		@project = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end


	private
	def project_params
	
		params.require(:project).permit(
			:title, 
			:description, 
			:start_time, 
			:end_time, 
			:category, 
			:tags
			)

	end




end
