class Booking < ApplicationRecord
  validates :check_in_at, presence: true
  validates :check_out_at, presence: true
  validate :validate_dates
  validates :guest_count, numericality: { greater_than: 0 }

  belongs_to :listing
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_id'
  
  private

  def validate_dates
    if check_in_at.present?
      errors.add(:check_in_at, 'can\'t be in the past') if check_in_at < Date.today
      errors.add(:check_out_at, 'can\'t be before check in') if check_out_at.present? and check_out_at <= check_in_at
    end
  end
end
