# frozen_string_literal: true

module Resolvers
  module Pkorg
    class SessionUserResolver < BaseResolver
      type Types::Entity::SessionUserType, null: true

      def resolve
        ::Pkorg::SessionUserService.new(
          object[:session_token],
          object[:base_url],
          object[:user_agent]
        ).retrieve
      end
    end
  end
end
