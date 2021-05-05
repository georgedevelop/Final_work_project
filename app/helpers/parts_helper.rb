module PartsHelper


	def options_for_vendor
	  	Vendor.all.map { |e| [e.name, e.id]  }
	end

end
