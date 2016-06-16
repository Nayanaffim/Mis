class EmployeesController < ApplicationController
	
	def dashboard
	end
	
	def index
<<<<<<< Updated upstream
		@employees =EmployeeDetail.all
=======
		@user=current_user
>>>>>>> Stashed changes
	end

	private
		def employee_params
      params.require(:employee_detail).permit(:user_id, :user_name,:first_name,:last_name,:dob,:doj,:blood_group,:designation,:oficial_email_id,:mobile,:landline,:current_address,:permanent_address,:skype_id,:personal_email_id,:guardian_full_name,:guardian_mobile,:guardian_landline,:guardian_address,:avatar)
    end
end
