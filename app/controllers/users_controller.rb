class UsersController < ApplicationController
 before_action :set_user , only:[:edit_password,:update_password]
	def index
  	@user = current_user
  	@users = User.where(:soft_delete => false).order(:created_at => :DESC)
  end

	def show
		@user = User.friendly.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to user_url, notice: "Updated User."
		else
			render :edit
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save
		  redirect_to user_url, notice: "User succesfully created!" 
		else
		  render :new
	  end
	end


  def show
    @user = User.friendly.find(params[:id])
  end


	def edit_password
  end

	def update_password
    if @user.update(update_user_params)
      redirect_to root_path,:notice => "Password Has been Changed Successfully..!"
    else
      render "edit_password"
    end
  end

  def soft_delete
    @user = User.find(params[:id])
    @user.update_attribute(:soft_delete,1)
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:role,:soft_delete)
  end

  def update_user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
