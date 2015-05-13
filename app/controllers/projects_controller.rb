class ProjectsController < ApplicationController

	def index
		@project = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		
		@project = Project.new
		 	if @project.save
  		redirect_to projects_url
  	else
  		render :new
  	end

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
			:tags,
			:rewards_attributes [:id, :title, :backer_limit, :description, :amount, :destroy],
			)

	end




end
