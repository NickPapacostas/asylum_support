class CaseCaseworker < ApplicationRecord
  belongs_to :case, optional: true
  belongs_to :caseworker, optional: true
end
