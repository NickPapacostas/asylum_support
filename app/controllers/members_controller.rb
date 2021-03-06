class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)

    if @member
       .if @member.save
      flash.now[:success] = "successfully updated!"
      redirect_to case_path(@member.case)
    else
      flash.now[:error] = "failed to update #{@member.errors.full_messages}"
      redirect_to case_path(@member.case)
    end
  end

  def index
    @members = Member.all
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      @member.create_activity(key: 'member.updated', owner: current_caseworker)
      flash[:success] = "Member updated"
    else
      flash[:error] = "Member not updated"
    end
    redirect_to case_path(@member.case)
  end

  private

  def member_params
    params.require(:member).permit(Member.strong_params)
  end
end
