class UsersController < ApplicationController
    before_action :authenticate_with_token, :only => [:destroy, :update, :fetch, :upload, :getMyProjects]
    before_action :find_user, :only => [:show, :upload, :getpicture]

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: 201
        else
            render json: {errors: @user.errors}, status: 422
        end
    end

    def index
        @users = User.all 
        render json: @users
    end

    def show
        render json: {user:@user, picture: @user.picture}
    end

    def update
        if current_user.update(user_params)
        render json: current_user, status: 200
        else
            render json: {errors: current_user.errors}, status: 422
        end
    end

    def destroy
        @user = current_user
        @user.destroy
        head 204
    end

    def fetch
        # projects = Project.where('user_id', current_user.id)
        render json: {current_user: current_user, picture: current_user.picture}
    end

    def getMyProjects
        user = User.find(current_user.id)
        myprojects = user.projects
        render json: myprojects
    end

    def upload
        if @user.update(picture: params[:picture])
            render json:{user: @user, picture: @user.picture}
        else
            render json: ["User not updated"]
        end
    end

    def getpicture
        render json: @user.picture
        # byebug
    end

    private 
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end
end
