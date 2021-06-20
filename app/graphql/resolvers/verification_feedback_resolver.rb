# frozen_string_literal: true

module Resolvers
  class VerificationFeedbackResolver < BaseResolver
    type Types::Entity::VerificationFeedbackType, null: true

    argument :token, String, required: true

    def resolve(token: nil)
      verification = Verification.find_by(token: token)

      raise GraphQL::ExecutionError, 'Couldn\'t find verification by token.' if verification.nil?

      verification
    end
  end
end
