class User < ActiveRecord::Base
    def self.create_user!(user)
        user[:session_token] = SecureRandom.base64
        User.create!(user)
    end
end
