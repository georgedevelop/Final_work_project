class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_admin

	layout 'dashboard'

	def index
		@users = User.all
	end

	def update_role
		@user = User.find(params[:id])

		respond_to do |format|
	      if @user.update(role_params)
	        format.html { redirect_to dashboard_users_path, notice: "Role was successfully updated." }
	      else
	        format.html { redirect_to dashboard_users_path, status: :unprocessable_entity }
	      end
	    end
	end
	

	private

	def authenticate_admin
		unless current_user.is_admin?
			redirect_to root_path
		end
	end

	# Only allow a list of trusted parameters through.
    def role_params
      params.require(:user).permit(policy_ids: [])
    end


end