class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password
  has_many :sessions, dependent: :destroy
  devise :omniauthable, omniauth_providers: [ :okta ]
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
