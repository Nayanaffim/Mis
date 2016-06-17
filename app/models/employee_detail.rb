class EmployeeDetail < ActiveRecord::Base
  belongs_to :user

  validates :official_email_id,:personal_email_id, presence: true
  validates :mobile ,presence: true, length: {minimum:10 ,maximum: 10}
  validates :first_name,:last_name,:dob,:date_of_join,:official_email_id,:mobile,:current_address,:permanent_address,:skype_id,:personal_email_id,
             :guardian_full_name,:guardian_address, presence: true 
  validates :guardian_full_name,format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "must be formatted correctly"}
  validates :first_name,:last_name,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :landline,:guardian_landline,:guardian_mobile, :numericality => true,:allow_nil => true
  # acts_as_birthday :dob 
  validate :dob_must_be_before_date_of_join

  def dob_must_be_before_date_of_join
    return unless dob and date_of_join
    errors.add(:dob, "must be before date of joining") unless dob < date_of_join
  end
end
