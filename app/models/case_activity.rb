class CaseActivity
	def self.all
		PublicActivity::Activity.where(trackable_type: 'Case')
	end

	def self.types
		[
			"Accompaniment",
			"Referral",
			"Appointment",
			"Contact",
			"Information/Advice Given"
		]
	end
end