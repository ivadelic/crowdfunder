
class ProjectsController < ApplicationController

	def index
			@projects = if params[:search]
			Project.where("LOWER(title) LIKE LOWER(?)", "%#{params[:search]}%")
		else 
			Project.all
		end

		@projects = @projects.order("projects.created_at DESC").page(params[:page])

		if request.xhr?
			render @projects
		end
	end

	private 
	def project_params
		params.require(:project).permit(
			:title,
			:description, 
			:start_time, 
			:end_time, 
			:category, 
			:tags, 
			:rewards_attributes [:id, :title, :backer_limit, :description, :amount, :destroy]
			)
	end
end

