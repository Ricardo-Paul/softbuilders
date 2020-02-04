class ContributorsController < ApplicationController
    before_action :authenticate_with_token, :only => [:create]

    def index
        @contributors = Contributor.all
        render json: @contributors
    end

    def create
       contributed_project = current_user.contributors.build(user_id: current_user.id, project_id: params[:contributor][:project_id])
       if contributed_project.save
        render json: current_user.contributed_projects, status: 201
       else
        render json: {errors: contributed_project.errors }, status: 422
       end
    end

    private
    def contributor_params
        params.require(:contributor).permit(:project_id)
    end
end
