class WorkOrderRequest < ApplicationRecord
	enum status: [:pending, :confirmed, :denied]



	def confirm
		self.update(status: 1)
		att = self.attributes.except("id", "status")
		wo = WorkOrder.new(att)
		wo.save
	end

	def deny
		self.update(status: 2)
	end
end
