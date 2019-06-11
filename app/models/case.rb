class Case < ApplicationRecord
  include PublicActivity::Model
  belongs_to :caseworker

  has_many :case_caseworkers
  accepts_nested_attributes_for :case_caseworkers, allow_destroy: true

  has_many :caseworkers, through: :case_caseworkers
  accepts_nested_attributes_for :caseworkers, allow_destroy: true

  has_many :members, -> { order(:id) }, dependent: :destroy
  accepts_nested_attributes_for :members, allow_destroy: true

  has_many_attached :files

  # has_many :linked_cases, foreign_key: :first_id

  def member_name
    members.try(:first).try(:full_name)
  end

  def member_nationality
    members.try(:first).try(:nationality)
  end

  def self.unrelated_caseworkers(case_id)
    if the_case = Case.find_by(id: case_id)
      Caseworker.all.reject { |caseworker| caseworker.id == the_case.caseworker_id || the_case.caseworkers.include?(caseworker) }
    else
      Caseworker.all
    end
  end
end
