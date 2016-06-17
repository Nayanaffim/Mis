class UserMailer < ApplicationMailer
	default from: 'affi.developer@gmail.com'

	def welcome(user)
		@user = user
		@url  = 'http://www.gmail.com'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end

   def new_user_account(user)
    @user = user
    mail(:to =>@user.email,:subject => "New Account created : #{user.firstname}")
  end
end
