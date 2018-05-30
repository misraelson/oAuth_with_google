class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(email: data['email']).first
    # Either create a User record or update it based on the provider (Google) and the UID
    unless user
      user = User.create(
         email: data['email'],
         password: Devise.friendly_token[0,20],
         token: access_token['credentials']['token'],
         refresh_token: access_token['credentials']['refresh_token']
      )
    end
    user
  end
end
