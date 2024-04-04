class Caseworker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :primary_cases, class_name: :Case, foreign_key: :caseworker_id
  # has_many :linked_cases, through: :primary_cases

  has_many :case_caseworkers, dependent: :destroy
  has_many :secondary_cases, through: :case_caseworkers, source: :case

  def cases
    primary_cases
  end

  def all_cases
    primary_cases.where(active: true) + secondary_cases.where(active: true) # + linked_cases.map(&:second)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["admin", "created_at", "email", "first_name", "id", "id_value", "last_name", "reset_password_sent_at", "updated_at"]
  end

end
