class EmployeesController < ApplicationController

	def dashboard
	end

	def index
	@employees =EmployeeDetail.all
	end

  def basic_detail_new
	 @employee = current_user.build_employee_detail
  end

	def basic_detail_create   
    @employee = current_user.build_employee_detail(employee_params)
     if @employee.save
      redirect_to  basic_detail_show_user_employees_path(current_user, @employee), :notice => "Details are succesfully saved."
     else
      render 'basic_detail_new'
     end
  end

  def basic_detail_show
    if current_user.employee_detail.blank?
      redirect_to  basic_detail_new_user_employees_path(current_user)   
    else
      @employee = current_user.employee_detail
    end
  end

	def basic_detail_edit
    @employee = current_user.employee_detail
  end

  def basic_detail_update
    @employee = current_user.employee_detail
      if @employee.update_attributes(employee_params)
        redirect_to basic_detail_show_user_employees_path,:notice => "Your Details are  updated"
      else
        render 'basic_detail_edit_user_employees'
      end
  end

  def academic_detail_new
   @academic = current_user.academic_details.new
  end

	def academic_detail_display
	 if current_user.academic_details.blank?
	  redirect_to academic_detail_new_user_employees_path(current_user)
	 else
	  @academices = current_user.academic_details
	 end 
	end

	def academic_detail_edit
	 @academic = current_user.academic_details.find(params[:academic])
	end

	def academic_detail_create
	 @academic = current_user.academic_details.create(academic_params)
	 if @academic.save
	  redirect_to academic_detail_display_user_employees_path(current_user), :notice => "Details are saved."
	 else
		render "academic_detail_new"
	 end
	end

	def academic_detail_update
	 @academic = current_user.academic_details.find(params[:academic])
	 if @academic.update_attributes(academic_params)
		redirect_to academic_detail_display_user_employees_path(current_user)
	 else
		render 'academic_detail_edit'
	 end
  end

  def bank_detail_new
    @bank = current_user.build_bank_and_identity_detail
  end

  def bank_detail_show
    if current_user.bank_and_identity_detail.blank?
      redirect_to bank_detail_new_user_employees_path(current_user)
    else
      @bank = current_user.bank_and_identity_detail
    end
  end

  def bank_detail_edit
    @bank = current_user.bank_and_identity_detail
  end
  
  def bank_detail_create
    @bank = current_user.build_bank_and_identity_detail(bank_and_identity_params)
    if @bank.save
      redirect_to bank_detail_show_user_employees_path(current_user), :notice => "your banking Details saved."
    else
      render "bank_detail_new"
    end
  end

  def bank_detail_update
    @bank = current_user.bank_and_identity_detail
    if @bank.update_attributes(bank_and_identity_params)
      redirect_to bank_detail_show_user_employees_path(current_user)
    else
      render 'bank_detail_edit'
    end
  end

  def previous_company_detail_new
    @previous = current_user.pre_company_details.new
  end
  
  def previous_company_detail_show
    if current_user.pre_company_details.blank?
      redirect_to previous_company_detail_new_user_employees_path(current_user)
    else
      @previous = current_user.pre_company_details
    end
  end

  def previous_company_detail_create
    @previous =  current_user.pre_company_details.create(previous_params)
    if @previous.save
      redirect_to previous_company_detail_show_user_employees_path, :notice => "Details saved."
    else
      render 'previous_company_detail_new'
    end
  end

  def previous_company_detail_edit
  
    @previous = current_user.pre_company_details.find(params[:pre])
  end

  def previous_company_detail_update
    @previous = current_user.pre_company_details.find(params[:pre])
    if @previous.update_attributes(previous_params)
      redirect_to previous_company_detail_show_user_employees_path(current_user)
    else
      render 'previous_company_detail_edit'
    end
  end
  
  def project_new
    @project =  current_user.project_details.new 
  end

  def project_edit
    @project =  current_user.project_details.find(params[:projectdetail])
  end

  def project_create
    @project =  current_user.project_details.create(project_params)
    if @project.save
      redirect_to project_show_user_employees_path, :notice => "your Details are saved."
    else
      render 'project_new'
    end
  end
 
  def project_update
    @project =  current_user.project_details.find(params[:projectdetail])
    if @project.update_attributes(project_params)
      redirect_to project_show_user_employees_path(current_user)
    else
      render 'project_edit'
    end
  end
 
  def project_show
    if current_user.project_details.blank?
      redirect_to project_new_user_employees_path(current_user)
    else
      @projects = current_user.project_details
    end
  end

  def send_email
    user = User.find(params[:user_id])
    UserMailer.welcome(user).deliver_now
    UserMailer.new_user_account(user).deliver_now
    respond_to do |format|
      format.js
    end
  end 

	private

	def academic_params
    params.require(:academic_detail).permit(:user_id, :course, :university, :passing_year, :percentage, :stream)
  end

  def bank_and_identity_params
      params.require(:bank_and_identity_detail).permit(:user_id,:account_no,:bank_name,:branch_name,:city,:ifsc_code,:pancard_no,:passport_no,:uid_no)
  end

	def employee_params
	 params.require(:employee_detail).permit(:user_id,:personal_email_id,:firstname,:lastname,:dob,:date_of_join,:blood_group,:official_email_id,:mobile,:landline,:current_address,:permanent_address,:skype_id,:guardian_full_name,:guardian_mobile,:guardian_landline,:guardian_address)
	end

	def previous_params
      params.require(:pre_company_detail).permit(:user_id, :company_name, :location, :designation, :from, :to, :last_CTC, :Resignation_reason,:employee_id )
  end

  def project_params
  	 params.require(:project_detail).permit(:user_id, :project_name,:your_role,:project_url,:description, :technology, :client_name,:company_name,:duration, :team_lead_name)
  end


	end

