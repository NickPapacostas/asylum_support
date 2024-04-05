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
    respond_to do |format|
      format.html { @members = Member.all }
      format.csv do
        attributes = Member.non_array_fields.concat(Member.array_fields.flat_map { |kv| kv.keys })
        csv = CSV.generate(headers: true) do |csv|
          csv << attributes

          Member.all.each do |user|
            csv << attributes.map{ |attr| user.send(attr) }
          end
        end

        send_data csv, filename: "members-#{Date.today}.csv"
      end
    end

  end


  def unaccompanied_minors
    cases_with_minors = Case.joins(:members).where('members.date_of_birth > ?', 18.years.ago)
    cases_with_minors_and_no_adults = cases_with_minors.reject { |c| c.members.any?(&:is_adult?) }
    cases = (cases_with_minors_and_no_adults + cases_specifically_marked).uniq



    @cases = cases.sort.reverse
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
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
