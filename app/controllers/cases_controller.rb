class CasesController < ApplicationController
	def new
		@case = Case.new
		@case.members.build
	end

	def edit
		@case = Case.find(params[:id])
	end

	def show
		@case = Case.find(params[:id])
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
	end

	private

	def case_params
		params.require(:case).permit(members_attributes: member_attributes)
	end

	def member_attributes
		[
	    :first_name,
	    :last_name,
	    :phone_number,
	    :email,
	    :document_number,
	    :notes
		]
	end

end