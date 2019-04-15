class CasesController < ApplicationController
	def new
		@case = Case.new
		@case.members.build
	end

	def edit
		@case = Case.find(params[:id])
		@activities = @case.activities
	end

	def show
		@case = Case.find(params[:id])
		@activities = @case.activities
	end

	def create
		@case = Case.new(case_params)
		@case.caseworker = current_caseworker

		if @case.save
			@case.create_activity(key: 'case.created', owner: current_caseworker)
			flash[:success] = "Case created"
			redirect_to case_path(@case)
		else
			flash[:error] = "Case not created"
		end
	end

	def update
		@case = Case.find(params[:id])

		if @case.update_attributes(case_params)
			@case.create_activity(key: 'case.updated', owner: current_caseworker)
			flash[:success] = "Case updated"
			redirect_to case_path(@case)
		else
			flash[:error] = "Case not updated"
			render :edit
		end
	end

	def create_activity
		@case = Case.find(params[:case_id])
		@activity = @case.activities.create(activity_params)
	end

	def all_activity
		@activities = CaseActivity.all
	end

	private

	def activity_params
		params.require(:activity)
	end

	def case_params
		params.require(:case).permit(:description, members_attributes: Member.strong_params)
	end
end