module Resolvers
  class Pkorg::EvaluationResolver < BaseResolver
    type Types::Pkorg::EvaluationType, null: true

    def resolve
      {
        title: object[:session_token]
      }
    end
  end
end