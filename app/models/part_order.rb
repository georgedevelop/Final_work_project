class PartOrder < ApplicationRecord
	has_many :part_items
	accepts_nested_attributes_for :part_items, reject_if: :all_blank, allow_destroy: true
	enum status: [:open, :closed]
	scope :open, -> { where(status: "open") }
	scope :closed, -> { where(status: "closed") }
end
