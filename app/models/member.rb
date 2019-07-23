class Member < ApplicationRecord
  include PublicActivity::Model

  has_one :case

  def self.asylum_office_options
    [
      "",
      "Katehaki",
      "Piraeus",
      "Alimos",
      "Thessaloniki",
      "Lesvos",
      "Samos",
      "Chios",
      "Kos",
      "Leros",
      "Rhodes",
      "Larissa"
    ].sort
  end

  def self.strong_params
    [
      :id,
      :case_id,
      :_destroy,
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :document_number,
      :notes,
      :case_number,
      :date_of_birth,
      :nationality,
      :gender,
      :language,
      :english_level,
      :arrival_date,
      :arrival_location,
      :regional_asylum_office,
      :geographic_restriction,
      :interview_date,
      :appeal_date,
      :amka,
      :afm,
      :bank_account,
      :relation,
      :lead_case_member,
      legal_status: [],
      vulnerabilities: [],
      housing: []
    ]
  end

  def self.housing_options
    [
      'Street homeless',
      'Staying with friends',
      'UNHCR or state housing',
      'Private accommodation',
      'NGO',
      'Camp',
      'Squat',
      'Other',
    ]
  end

  def self.legal_status_options
    [
      "Undocumented",
      "Pre-registration card",
      "White Card",
      "1st Appeal",
      "2nd Appeal",
      "Discontinued",
      "Refused Undocumented",
      "Fresh Claim",
      "Refugee Status",
      "Dublin Reunification",
      "NA"
    ]
  end

  def self.vulnerability_options
    [
      'Unaccompanied minor',
      'Disability / serious illness',
      'Elderly',
      'Pregnant / recently given birth',
      'Single parent with minor children',
      'Trauma (torture, rape, shipwreck)',
    ]
  end

  def self.nationalities
    [
      "Tanzania",
      "Syria",
      "Bangladesh",
      "Pakistan",
      "India",
      "Sri Lanka",
      "Myanmar",
      "Balochistan",
      "Afghanistan",
      "Kurdistan (Iraq)",
      "Kurdistan (Iran)",
      "Kurdistan (Syria)",
      "Kurdistan (Turkey)",
      "Iran",
      "Iraq",
      "Kuwait",
      "Yemen",
      "Turkey",
      "Lebanon",
      "Egypt",
      "Palestine",
      "Jordan",
      "Libya",
      "Algeria",
      "Tunisia",
      "Morocco",
      "Western Sahara",
      "DR Congo",
      "Central African Republic",
      "Cameroon",
      "Ivory Coast",
      "Guinea",
      "Nigeria",
      "Senegal",
      "Gambia",
      "Burkina Faso",
      "Benin",
      "Ghana",
      "Sierra Leone",
      "Somalia",
      "Ethiopia",
      "Eritrea",
      "South Sudan",
      "Sudan",
      "Rwanda",
      "Burundi",
      "Albania",
      "Georgia",
      "Cuba",
      "Sierra Leone"
    ].sort
  end

  def self.relation_options
    [
      "Mother/Wife",
      "Single Mother",
      "Wife",
      "Unmarried Partner",
      "Father/Husband",
      "Husband",
      "Single Father",
      "Daughter",
      "Son",
      "Brother ",
      "Sister",
      "Single Person",
      "Unaccompanied Minor",
      "Cousin",
      "Grandmother",
      "Grandfather",
      "Granddaughter ",
      "Grandson",
      "Uncles",
      "Aunt",
      "Niece",
      "Nephew"
    ].sort
  end

  def country_of_origin
    nationality
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_birthdate
    return nil unless date_of_birth

    date_of_birth.strftime("%d/%m/%Y")
  end

  before_validation :set_dates

  def set_dates
    self.arrival_date = Date.parse(arrival_date.to_s) if arrival_date
    self.interview_date = Date.parse(interview_date.to_s) if interview_date
    self.interview_date = Date.parse(interview_date.to_s) if interview_date
    self.appeal_date = Date.parse(appeal_date.to_s) if appeal_date
  end
end
