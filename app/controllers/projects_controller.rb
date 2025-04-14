class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      render json: {}, status: :no_content
    else
      render :show, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
