module UsersHelper


	def options_for_policy
	  	Policy.all.map { |e| [e.name, e.id]  }
	end

end
