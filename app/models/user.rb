class User < ActiveRecord::Base

    has_many :groups
    has_many :favorites

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.nickname  = auth.info.nickname
    user.email     = auth.info.email
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.location  = auth.info.location
    user.save

    user
  end
end
