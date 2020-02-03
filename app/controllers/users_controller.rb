class UsersController < ApplicationController
    before_action :authenticate_with_token, :only => [:destroy, :update]
    before_action :find_user, :only => [:show]

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
        render json: @user
    end

    def update
        if current_user.update(user_params)
        render json: current_user, status: 200
        else
            render json: {errors: @user.errors}, status: 422
        end
    end

    def destroy
        @user = current_user
        @user.destroy
        head 204
    end

    private 
    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

