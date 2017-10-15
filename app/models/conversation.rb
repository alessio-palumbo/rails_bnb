class Conversation < ApplicationRecord
  # validates :host, uniqueness: { scope: :guest }

  belongs_to :listing, foreign_key: 'host_id'
  belongs_to :host, class_name: 'User'
  belongs_to :guest, class_name: 'User'


  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  scope :participating, -> (user) do
    where("(conversations.host_id = ? OR conversations.guest_id = ?)", user.id, user.id)
  end

  # scope :between, -> (guest_id, host_id) do
  #   where(guest_id: guest_id, host_id: host_id).or(where(guest_id: host_id, host_id: guest_id))
  # end

  # def participates?(user)
  #   guest == user || host == user
  # end

  def name(user_id)
    User.find(user_id).email
  end
end
