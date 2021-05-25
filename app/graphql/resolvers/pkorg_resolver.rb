# frozen_string_literal: true

module Resolvers
  class PkorgQueryType < Types::BaseObject
    field :evaluation, resolver: Pkorg::EvaluationResolver
    field :session_user, resolver: Pkorg::SessionUserResolver
  end

  class PkorgResolver < BaseResolver
    type PkorgQueryType, null: true

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
