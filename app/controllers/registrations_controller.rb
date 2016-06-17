class RegistrationsController < Devise::RegistrationsController
  before_filter         :check_permissions, :only => [ :new, :create, :cancel ] 
  skip_before_filter    :require_no_authentication 
  # GET /resource/sign_up
  def new
    super
  end

  def check_permissions
    authorize! :create, resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected
  def sign_up_params
    # devise_parameter_sanitizer.sanitize(:sign_up)
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :creators_id)
  end
end

  