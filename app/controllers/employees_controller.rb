class EmployeesController < ApplicationController
	
	def dashboard
	end
	
	def index
		@employees =EmployeeDetail.all
	end

	private
	def employee_params
    params.require(:employee_detail).permit(:userid, :user_name,:firstname,:lastname,:dob,:date_of_join,:blood_group,:designation,:official_email_id,:mobile_number,:landline,:current_address,:permanent_address,:skype_id,:personal_email_id,:guardian_full_name,:guardian_mobile,:guardian_landline,:guardian_address,:avatar)
  end
end
