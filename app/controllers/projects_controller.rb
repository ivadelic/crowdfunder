
class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

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


  def new
   @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end


  def create
    @project = Project.new(project_params)
    @project.user = current_user
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
      :rewards_attributes => [:id, :title, :backer_limit, :description, :amount, :destroy]
      )
  end
end
