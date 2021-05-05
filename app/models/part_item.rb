class PartItem < ApplicationRecord
	belongs_to :part_order
	after_update :check_po


	private

	def check_po
		po = self.part_order
		part_items = po.part_items.map(&:quantity)
		part_items_received = po.part_items.map(&:received)
		if part_items == part_items_received
			po.update(status: 'closed')
		else
			po.update(status: 'open')
		end
	end
end