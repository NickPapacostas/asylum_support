class Caseworker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :case_caseworkers
  has_many :cases, through: :case_caseworkers

  def full_name
  	"#{first_name} #{last_name}"
  end
end
