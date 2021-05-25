# frozen_string_literal: true

module Types
  class PkorgQueryType < Types::BaseObject
    field :evaluation, resolver: Resolvers::Pkorg::EvaluationResolver
    field :session_user, resolver: Resolvers::Pkorg::SessionUserResolver
  end
end
