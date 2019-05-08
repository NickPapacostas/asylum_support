class DashboardsController < ApplicationController
	before_action :authenticate_caseworker!

	def show
		@caseworker = current_caseworker
		@activities = PublicActivity::Activity.where(owner_id: @caseworker.id).order(updated_at: :desc).limit(10)
	end
end
