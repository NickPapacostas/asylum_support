class CasesController < ApplicationController
	def new
		@case = Case.new
		@case.members
	end

	def edit
		@case = Case.find(params[:id])
		@activities = @case.activities
	end

	def find
		if params[:case_number]
			redirect_to case_path(params[:case_number].to_i)
		else
			flash.now[:error] = "Case not found"
			render :show
		end
	end

	def index
	  respond_to do |format|
	    format.html
	    format.json { render json: CaseDatatable.new(params) }
	  end
	end

	def show
		@case = Case.find(params[:id])
		@activities = @case.activities.where(key: "case.activity_created").reverse.take(10)
	end

	def create
		@case = Case.new(case_params)
		@case.caseworker = current_caseworker

		if @case.save && @case.members.map(&:save)
			@case.reload
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
		@activity = @case.create_activity(
			'activity_created',
			owner: current_caseworker,
			case_activity_type: activity_params[:case_activity_type],
			notes: activity_params[:notes]
			)
		redirect_to case_path(@case)

	end

	def all_activity
		@activities = CaseActivity.all
	end

	private

	def activity_params
		params.require(:activity).permit(:case_activity_type, :notes)
	end

	def case_params
		params.require(:case).permit(:description, members_attributes: Member.strong_params)
	end
end