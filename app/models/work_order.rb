class WorkOrder < ApplicationRecord
	enum status: [:pending, :completed]
	scope :completed, -> { where(status: "completed") }
	scope :pending, -> { where(status: "pending") }
	validates :location, :issue, :line, :machine, :work_order_type, :request_date_time, :level_of_issue, :requested_by, :email, :description_of_issue, :planned_date_and_time, :complete_date_and_time, presence: true
end
