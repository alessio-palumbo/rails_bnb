class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        #  , foreign_key: 'host_id', class_name: 'User'
  has_many :listings, foreign_key: 'host_id', dependent: :destroy
  has_many :conversations, foreign_key: 'guest_id', dependent: :destroy
  has_many :messages, through: :conversations, dependent: :destroy  
end
