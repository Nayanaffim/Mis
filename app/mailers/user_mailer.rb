class UserMailer < ApplicationMailer


  default from: 'affi.developer@gmail.com'
   
   def welcome(user)
      @user = user
      @url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
   end
end
