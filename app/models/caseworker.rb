class Caseworker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :primary_cases, class_name: :Case, foreign_key: :caseworker_id
  # has_many :linked_cases, through: :primary_cases

  has_many :case_caseworkers
  has_many :secondary_cases, through: :case_caseworkers, source: :case

  def cases
    primary_cases
  end

  def all_cases
    primary_cases + secondary_cases # + linked_cases.map(&:second)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
