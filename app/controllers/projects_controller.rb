class ProjectsController < ApplicationController
    before_action :set_project, only: [:edit, :show, :update, :destroy]
    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.save
        if @project.save
            redirect_to project_path(@project)
        else
            render 'new'
        end
    end

    def show
    end

    def update
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render 'edit'
        end
    end

    def edit
    end

    def index
        @projects = Project.all
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    private

    def project_params
        params.require(:project).permit(:title, :description, :due_date)
    end

    def set_project
        @project = Project.find(params[:id])
    end
end
