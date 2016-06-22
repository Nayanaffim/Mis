class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise        :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
	belongs_to    :role
	before_create :prepare_username,:gen_password
	after_create  :send_mail
 
  has_one :employee_detail
  extend FriendlyId
  friendly_id :username, use: :slugged
  devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable
  has_one  :employee_detail
  has_one  :bank_and_identity_detail
  has_many :academic_details 
  has_many :pre_company_details
  has_many :project_details
  has_many :sales_consultants
  has_many :sales_bds
  belongs_to :role
  before_create :prepare_username,:gen_password
  after_create :send_mail
	before_save { self.email = email.downcase}
	validates :firstname,:lastname ,presence:true
	# validates :firstname,:lastname,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

	validates_confirmation_of :password 
	VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
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
	 rand_password =  [('a'..'z'), (0..9)].map{|i| i.to_a}.flatten
	 self.password = self.password_confirmation = self.pwd = (0..5).map{ rand_password[rand(rand_password.length)] }.join if self.password.blank?
	end
	
	def send_mail 
		UserMailer.welcome(self).deliver_now
		UserMailer.new_user_account(self).deliver_now
	end
end
