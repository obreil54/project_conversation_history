class CommentsController < ApplicationController
  before_action :set_project

  def create
    @project.add_comment(params[:content])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @project }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end
end
