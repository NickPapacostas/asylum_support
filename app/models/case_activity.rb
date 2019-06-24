class CaseActivity
  def self.all
    PublicActivity::Activity.where(trackable_type: 'Case')
  end

  def self.find_case(activity:)
    Case.find(activity.trackable_id)
  end

  def self.types
    [
      "Accompaniment to NGO",
      "Accompaniment to GAS",
      "Accompaniment to Hospital",
      "Accompaniment to Police",
      "Accompaniment to UNHCR",
      "Accompaniment to Solidarity Now",
      "Accompaniment to Other",
      "Collection from GAS",
      "Referral to Housing",
      "Referral to Squat",
      "Referral to Lawyer",
      "Referral to Medical",
      "Referral to Psychologist",
      "Referral to NGO",
      "Referral to RLS",
      "Referral to Solidarity Now",
      "Referral to Aitima",
      "Referral to Skype",
      "Referral to Other",
      "Appointment with Theo",
      "Appointment with Housing",
      "Appointment with Lawyer",
      "Appointment with GAS",
      "Appointment with Medical",
      "Appointment with Psychologist",
      "Appointment with NGO",
      "Appointment with Other",
      "Contact with Hospital",
      "Contact with Housing",
      "Contact with Lawyer",
      "Contact with GAS",
      "Contact with Medical",
      "Contact with Psychologist",
      "Contact with Other",
      "Other",
      "Information/Advice Given",
      "Registration at GAS",
      "Contact NGO",
      "Contact with visitor",
      "Appointment with Appeals Authority",
      "Reminder",
      "Protection Letter",
      "No Action Taken",
      "Housing Found",
      "Cash Card Accepted",
      "Registration for AMKA",
      "Registration for ΑΦΜ",
      "Lawyer Found"

    ].sort
  end
end
