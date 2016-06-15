class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :role
  before_create :prepare_username,:gen_password
  after_create :send_mail

      def prepare_username
        self.username = (self.firstname[0..2] +"."+self.lastname).to_s.downcase
      end

      def password_required?
 			false
 	  end
 
 	  def email_required?
  			true
 	  end

 	  def gen_password
 		 o =  [('a'..'z'), (0..9)].map{|i| i.to_a}.flatten
  	     self.password = self.password_confirmation = self.pwd = (0..5).map{ o[rand(o.length)] }.join if self.password.blank?
  	  end

      def send_mail
  	   UserMailer.welcome(self).deliver
      end
end