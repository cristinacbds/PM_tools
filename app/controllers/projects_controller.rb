class ProjectsController < ApplicationController
    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.save
        p @project.errors
        if @project.save
            p @project
            redirect_to projects_path(@project)
        else
            render 'new'
        end
    end



    private

    def project_params
        params.require(:project).permit(:title, :description, :due_date)
    end
end
