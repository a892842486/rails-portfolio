class Admin::ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.links.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params.except(:images))
      @project.images.attach(params[:project][:images]) if params[:project][:images].present?

      redirect_to admin_projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to admin_projects_path
  end

  def destroy_image
    @project = Project.find(params[:id])
    image = @project.images.attachments.find(params[:image_id])
    image.purge

    redirect_to edit_admin_project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :summary,
      :description,
      skill_ids: [],
      links_attributes: [ :id, :label, :url, :_destroy ],
      images: []
      )
  end
end
