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
			:english_level,
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
			"Fresh Claim",
			"None"
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
		["Syria",
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
			"Albania"
		]
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
end