class Case < ApplicationRecord
  include PublicActivity::Model
  belongs_to :caseworker
	has_many :members, -> { order(:id) }, dependent: :destroy
  accepts_nested_attributes_for :members, allow_destroy: true
  has_many_attached :files
end
