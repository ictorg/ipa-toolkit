# frozen_string_literal: true

module Mutations
  module Verification
    class CreateVerificationMutation < BaseMutation
      field :verification, Types::Entity::VerificationType, null: false

      argument :verification, Types::Input::VerificationInputType, required: true

      def resolve(verification:)
        created_verification = ::Verification.create!(verification.to_h)

        VerificationMailer.with(verification: created_verification).invite.deliver_now

        {
          verification: created_verification
        }
      end
    end
  end
end
