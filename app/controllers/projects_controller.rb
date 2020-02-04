class ProjectsController < ApplicationController
    before_action :authenticate_with_token, :only => [:create, :update, :destroy]

    def index
        projects = Project.all 
        render json: projects
    end

    def show
        project = Project.find(params[:id])
        render json: project
    end

    def create
        project = current_user.projects.build(project_params)
        if project.save
            render json: project
        end
    end

    def update
        project = current_user.projects.find(params[:id])
        if project.update(project_params)
            render json: project
        else
            render json: {errors: project.errors}
        end
    end

    def destroy
        project = current_user.projects.find(params[:id])
        project.destroy
        head 204
    end

    
    private
    def project_params
        params.require(:project).permit(:title, :stacks, :description, :gitlink, company_attributes:[:name, :address])
    end
end
