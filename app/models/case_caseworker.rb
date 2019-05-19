class CaseCaseworker < ApplicationRecord
	belongs_to :case
	belongs_to :caseworker
end