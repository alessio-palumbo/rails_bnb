class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

        #  , foreign_key: 'host_id', class_name: 'User'
  has_many :listings, foreign_key: 'host_id', dependent: :destroy
  has_many :host_conversation, through: :listings, foreign_key: 'host_id', dependent: :destroy
  has_many :guest_conversations, foreign_key: 'guest_id', dependent: :destroy
  has_many :messages, through: :host_conversations, dependent: :destroy  
  has_many :messages, through: :guest_conversations, dependent: :destroy  

  has_one :profile, dependent: :destroy

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
end
end
