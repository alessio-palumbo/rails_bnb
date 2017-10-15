class Message < ApplicationRecord
  validates :body, presence: true

  belongs_to :conversation
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
end
