class ActivitiesController < ApplicationController
  def activity_table
    respond_to do |format|
      format.html
      format.json { render json: ActivityDatatable.new(params, view_context: view_context) }
    end
  end

  def index
    @acivites = CaseActivity.all
  end

  def update
    @activity = PublicActivity::Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to case_path CaseActivity.find_case(activity: @activity)
    end
  end

  def destroy
    @activity = PublicActivity::Activity.find(params[:id])
    @activity.destroy

    redirect_to case_path(@activity.trackable_id)
  end

  private

  def activity_params
    params.require(:public_activity_activity).permit(:case_activity_type, :notes, :relevant_future_date)
  end
end
