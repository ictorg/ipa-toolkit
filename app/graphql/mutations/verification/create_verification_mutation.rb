# frozen_string_literal: true

module Mutations
  module Verification
    class CreateVerificationMutation < BaseMutation
      field :verification, Types::Entity::VerificationType, null: false

      argument :verification, Types::Input::VerificationInputType, required: true

      def resolve(verification:)
        new_verification = ::Verification.new(verification.to_h)
        new_verification.token = SecureRandom.hex(32)
        new_verification.save!

        VerificationMailer.with(verification: new_verification).invite.deliver_now

        {
          verification: new_verification
        }
      end
    end
  end
end
