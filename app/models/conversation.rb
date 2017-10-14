class Conversation < ApplicationRecord
  validates :host, uniqueness: { scope: :guest }

  belongs_to :host, class_name: 'User'
  belongs_to :guest, class_name: 'User'

  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  scope :participating, -> (user) do
    where("(conversations.host_id = ? OR conversations.guest_id = ?)", user.id, user.id)
  end

  def name(user_id)
    User.find(user_id).email
  end
end
