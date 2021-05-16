module Resolvers
  class PkorgResolver < BaseResolver
    type Types::PkorgType, null: true

    argument :session_token, String, required: true
    argument :base_url, String, required: true
    argument :user_agent, String, required: false

    def resolve(session_token: nil, base_url: nil, user_agent: nil)
      {
        session_token: session_token,
        base_url: base_url,
        user_agent: user_agent
      }
    end
  end
end