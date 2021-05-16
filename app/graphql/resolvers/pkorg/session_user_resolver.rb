module Resolvers
  class Pkorg::SessionUserResolver < BaseResolver
    type Types::Pkorg::SessionUserType, null: true

    def resolve
      ::Pkorg::SessionUserService.new(
        object[:session_token],
        object[:base_url],
        object[:user_agent]
      ).retrieve
    end
  end
end