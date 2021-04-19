class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters

       devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName])
       
       devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName])
    end
    
    def require_admin
      if !current_user.admin?
         flash[:alert] = "Not authorised"
         redirect_to root_path
      end
    end

end
