class ActivitiesController < ApplicationController
	def activity_table
		respond_to do |format|
	    format.html
	    format.json { render json: ActivityDatatable.new(params) }
	  end
	end

	def index
		@acivites = CaseActivity.all
	end
end