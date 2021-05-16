module Resolvers
  class Pkorg::EvaluationResolver < BaseResolver
    type Types::Pkorg::EvaluationType, null: true

    argument :evaluation_path, String, required: true

    def resolve(args)
      ::Pkorg::EvaluationService.new(
        object[:session_token],
        object[:base_url],
        object[:user_agent],
        args[:evaluation_path]
      ).retrieve
    end
  end
end