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
      format.json { render json: CaseDatatable.new(params, view_context: view_context, lawyer: params[:lawyer], active: params[:active]) }
    end
  end

  def show
    @case = Case.find(params[:id])
    set_activities
  end

  def create
    @case = Case.new(case_params)
    @case.caseworker = current_caseworker unless @case.caseworker
    if @case.save
      @case.reload
      @case.create_activity(key: 'case.created', owner: current_caseworker, case_activity_type: "Case created")
      flash[:success] = "Case created"
      redirect_to case_path(@case)
    else
      flash[:error] = "Case not created:  #{@case.errors.full_messages}"
    end
  end

  def update
    @case = Case.find(params[:id])
    set_activities

    if @case.update_attributes(case_params)
      @case.case_caseworkers.select { |ccw| ccw.caseworker_id.nil? }.map(&:destroy)
      flash[:success] = "Case updated"
      redirect_to case_path(@case)
    else
      flash[:error] = "Case not updated: #{@case.errors.full_messages}"
      render :edit
    end
  end

  def create_activity
    @case = Case.find(params[:case_id])
    @activity = @case.create_activity(
      'activity_created',
      owner: current_caseworker,
      case_activity_type: activity_params[:case_activity_type],
      relevant_future_datetime: activity_params[:relevant_future_datetime],
      notes: activity_params[:notes]
    )
    redirect_to case_path(@case)
  end

  def all_activity
    @activities = CaseActivity.all
  end

  private

  def set_activities
    @activities = @case.activities.where(key: "case.activity_created").order(created_at: :desc)
  end

  def activity_params
    params.require(:public_activity_activity).permit(:case_activity_type, :notes, :relevant_future_datetime)
  end

  def case_params
    params.require(:case)
      .permit(
        :lawyer,
        :google_drive_link,
        :description,
        :active,
        :caseworker_id,
        case_caseworkers_attributes: [:caseworker_id],
        members_attributes: Member.strong_params, files: []
      )
  end
end
