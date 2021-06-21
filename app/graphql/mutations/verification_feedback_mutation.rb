# frozen_string_literal: true

module Mutations
  class VerificationFeedbackMutation < BaseMutation
    field :verification, Types::Entity::VerificationFeedbackType, null: false

    argument :token, String, required: true
    argument :change_grading, Boolean, required: true
    argument :comment, String, required: false

    def resolve(token:, change_grading:, comment:)
      verification = ::Verification.find_by(token: token)

      raise GraphQL::ExecutionError, 'Couldn\'t find verification by token.' if verification.nil?

      verification.change_grading = change_grading
      verification.comment = comment
      verification.verified_at = DateTime.now
      verification.save!
      
      {
        verification: verification
      }
    end
  end
end
