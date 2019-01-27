class ApplicationController < ActionController::Base
	before_action :authenticate_caseworker!


	def after_sign_in_path_for(caseworker)
  	caseworker_dashboard_path(caseworker)
	end

	def after_sign_out_path_for(caseworker)
	  new_session_path(caseworker)
	end
end
