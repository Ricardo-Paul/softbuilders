class ApplicationController < ActionController::API
    # protect_from_forgery with: :null_session
#     skip_before_action :verify_authenticity_token

#     before_filter :configure_permitted_parameters, if: :devise_controller?
#     protected

#     def configure_permitted_parameters
#         devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
#         devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
#     end
    include Authenticable
end
