class ProjectsController < ApplicationController

	def index
		@project = Project.all
	end

  def show
    @project = Project.find(params[:id])
  end

  def new
   @project = Project.create
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project created successfully!"
    else
      render 'new', alert: "Something went wrong! Try again?"
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
      :goal_amount, 
      rewards_attributes: [:id, :amount, :title, :description, :backer_limit, :_destroy]
    )
  end

end
