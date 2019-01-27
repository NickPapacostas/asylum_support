class DashboardsController < ApplicationController
	before_action :authenticate_caseworker!

	def show
		@caseworker = current_caseworker
	end
end
