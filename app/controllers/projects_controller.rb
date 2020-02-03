class ProjectsController < ApplicationController
    before_action :authenticate_with_token, :only => [:create, :update, :destroy]
    def index
        projects = Project.all 
        render json: projects
    end

    def create
        project = current_user.projects.build(project_params)
        if project.save
            render json: project, status: 201
        else
            render json: {errors: project.errors}
        end
    end

    private
    def project_params
        params.require(:project).permit(:title, :stacks, :description, :gitlink)
    end
end
