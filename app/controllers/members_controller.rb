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

  def unaccompanied_minors
    cases_with_minors = Case.joins(:members).where('members.date_of_birth > ?', 18.years.ago)
    cases_with_minors_and_no_adults = cases_with_minors.reject { |c| c.members.any?(&:is_adult?) }
    cases = (cases_with_minors_and_no_adults + cases_specifically_marked).uniq



    @cases = cases.sort.reverse
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

  def cases_specifically_marked
    members = Member.where("'Unaccompanied minor' = any(vulnerabilities)")
    Case.where(id: members.map(&:case_id))
  end

  def member_params
    params.require(:member).permit(Member.strong_params)
  end
end
