# frozen_string_literal: true

module Resolvers
  class VerificationResultsResolver < BaseResolver
    type [Types::Entity::VerificationResultType], null: true

    argument :token, String, required: true

    def resolve(token)
      Verification.find_by(token: token)
    end
  end
end
