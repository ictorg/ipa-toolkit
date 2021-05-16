module Types
  class PkorgType < Types::BaseObject
    field :evaluation, resolver: Resolvers::Pkorg::EvaluationResolver
    field :session_user, resolver: Resolvers::Pkorg::SessionUserResolver
  end
end