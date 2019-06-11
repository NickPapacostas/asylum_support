class CaseCaseworkersController < ApplicationController
  def destroy
    @case_caseworker = CaseCaseworker.find(params[:id])
    @case_caseworker.destroy
  end
end
