class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        #  , foreign_key: 'host_id', class_name: 'User'
  has_many :listings, foreign_key: 'host_id', dependent: :destroy
  has_many :host_conversations, class_name: 'Conversation', foreign_key: 'host_id', dependent: :destroy
  has_many :guest_conversations, class_name: 'Conversation', foreign_key: 'guest_id', dependent: :destroy
  has_many :messages, through: :host_conversations, dependent: :destroy
  has_many :messages, through: :guest_conversations, dependent: :destroy
  
end
