# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :pkorg, mutation: Mutations::PkorgMutation
    field :users, mutation: Mutations::UserMutation
    field :verifications, mutation: Mutations::VerificationMutation
    field :conferences, mutation: Mutations::ConferenceMutation
  end
end
