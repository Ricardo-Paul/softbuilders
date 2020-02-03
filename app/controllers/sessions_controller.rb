class SessionsController < ApplicationController
    def create
        user_email = params[:sessions][:email]
        user_password = params[:sessions][:password]

        user = user_email.present? && User.find_by(email: user_email)
        if user.valid_password? user_password
            sign_in user, store: false
            user.generate_authentication_token!
            user.save
            render json: user, status: 200, message: "logged in"
        else
            render json: {errors: "Invalid email or password"}, status: 422
        end
    end

    def destroy
        user = User.find_by(auth_token: request.headers["Authorization"])
        user.save
        head 204
    end

end
