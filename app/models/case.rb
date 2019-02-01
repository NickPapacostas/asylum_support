class Case < ApplicationRecord
  include PublicActivity::Model
  # tracked

  belongs_to :caseworker
  has_many :members
  accepts_nested_attributes_for :members, allow_destroy: true

end
