module PoliciesHelper


	def options_for_role
	  	Role.all.map { |e| [e.name, e.id]  }
	end

end
