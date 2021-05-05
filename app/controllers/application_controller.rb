class ApplicationController < ActionController::Base
layout :layout

  private


def layout
	if devise_controller? && controller_name == "registrations" && action_name == "edit"
	  "dashboard"
	else
	  "application"
	end
end
end
