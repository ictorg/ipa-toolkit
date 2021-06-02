# frozen_string_literal: true

module Mutations
  class VerificationMutationType < Types::BaseObject
    field :createVerification, mutation: Verification::CreateVerificationMutation
  end

  class VerificationMutation < BaseMutation
    type VerificationMutationType

    def resolve
      {}
    end
  end
end
