class Profile < ApplicationRecord
  belongs_to :user

  validates :username, :first_name, :last_name, :mobile_number, presence: true
end
