class AcademicDetail < ActiveRecord::Base
  belongs_to :user
  validates :course,:university,:passing_year,:percentage,:stream, presence: true
  validates :percentage,:numericality => { :greater_than => 0.01 , message: "should be only no."}
  validates :course,:university,format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "must be formatted correctly"}
end
