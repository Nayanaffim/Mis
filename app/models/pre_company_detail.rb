class PreCompanyDetail < ActiveRecord::Base
  belongs_to :user
  validates :company_name,:location,:from,:to,:last_CTC, presence:true
  validates :last_CTC,:numericality => { :greater_than => 0.01 }
  validate :from_month_must_be_before_to_month

  def from_month_must_be_before_to_month
  return unless from and to
  errors.add(:from, "must be before to month year") unless from < to
  end
end
