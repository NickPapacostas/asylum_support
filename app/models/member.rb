class Member < ApplicationRecord
	include PublicActivity::Model

	has_one :case

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
			:arrival_date,
			:arrival_location,
			:regional_asylum_office,
			:geographic_restriction,
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
			"White card",
			"Refugee",
			"Refused 1st appeal",
			"Refused 2nd appeal",
			"Refused undocumented",
			"Fresh Claim"
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

  def full_name
  	"#{first_name} #{last_name}"
  end
end