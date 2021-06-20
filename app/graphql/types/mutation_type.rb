# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :verification_feedback, mutation: Mutations::VerificationFeedbackMutation, authenticate: false

    field :pkorg, mutation: Mutations::PkorgMutation
    field :users, mutation: Mutations::UserMutation
    field :verifications, mutation: Mutations::VerificationMutation
    field :conferences, mutation: Mutations::ConferenceMutation
  end
end
