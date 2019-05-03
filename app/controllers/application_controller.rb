class ApplicationController < ActionController::Base
	before_action :authenticate_caseworker!
 	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(caseworker)
  	caseworker_dashboard_path(caseworker)
	end

	def after_sign_out_path_for(caseworker)
	  new_session_path(caseworker)
	end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
