module Api
  module V1
    module Entities
      class UserBase < Grape::Entity
        expose :id
        expose :name
        expose :email
        expose :avatar_url

        private

        def avatar_url
          gravatar_url(object.email)
        end

        def gravatar_url(email)
          Gravatar.new(email).image_url(secure: true)
        end
      end
    end
  end
end
