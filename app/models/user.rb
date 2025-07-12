class User < ApplicationRecord
  
  # normalizes :email_address, with: ->(e) { e.strip.downcase }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:okta, :oidc]

  def self.from_omniauth(auth)
    return nil unless auth&.info

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]  # Required if local login is present
      user.name = auth.info.name
    end
  end
end
