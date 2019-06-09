class DashboardsController < ApplicationController
	before_action :authenticate_caseworker!

	def show
		@caseworker = current_caseworker
		@activities = PublicActivity::Activity.where(owner_id: @caseworker.id).order(updated_at: :desc).limit(10)
	end


	def lawyer
		@activities = Case.where(lawyer: true).flat_map(&:activities)
	end
end
