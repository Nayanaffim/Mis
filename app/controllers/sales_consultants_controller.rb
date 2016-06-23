class SalesConsultantsController < ApplicationController
  
  def sales_bd_new
    @sale = current_user.sales_bds.new
  end

  def sales_bd_create
    @sale = current_user.sales_bds.create(sale_params)
    if @sale.save
      redirect_to sales_bd_show_user_sales_consultants_path(current_user), :notice => "Details saved."
    else
      render 'sales_bd_new'
    end
  end

  def sales_bd_show
    if current_user.sales_bds.blank?
      redirect_to  sales_bd_new_user_sales_consultants_path(current_user)
    else
      @sale = current_user.sales_bds
    end 
  end 

  def sales_bd_edit
    @sale = current_user.sales_bds.find(params[:sale])
  end

  def sales_bd_update
     @sale = current_user.sales_bds.find(params[:sale])
       if @sale.update_attributes(sale_params)
         redirect_to sales_bd_show_user_sales_consultants_path(current_user)
       else
         render 'sales_bd_edit'
      end
  end

 def saleconsultant_new
    @consultant = current_user.sales_consultants.new
 end

 def saleconsultant_create
    @consultant = current_user.sales_consultants.create(sales_params)
    if @consultant.save
      redirect_to saleconsultant_show_user_sales_consultants_path(current_user), :notice => "Details saved."
    else
      render "saleconsultant_new"
    end
 end

 def saleconsultant_edit
  @consultant = current_user.sales_consultants.find(params[:consultants])
 end

 def saleconsultant_show
   if current_user.sales_consultants.blank?
    redirect_to saleconsultant_new_user_sales_consultants_path(current_user)
  else
    @consultants = current_user.sales_consultants
  end
 end

 def saleconsultant_update
  @consultant = current_user.sales_consultants.find(params[:consultants])
  if @consultant.update_attributes(sales_params)
    redirect_to saleconsultant_show_user_sales_consultants_path(current_user)
  else
    render 'saleconsultant_new'
  end
end

private

def sales_params
  params.require(:sales_consultant).permit(:user_id, :name, :comission, :contact,:skype_id, :email_id,:location, :address,:bank_account_no,:bank_name,:ifsc_code)
end

def sale_params
  params.require(:sales_bd).permit(:sales_id, :skype_id)
end
end
