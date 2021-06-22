# frozen_string_literal: true

module Mutations
  module Verification
    class CreateVerificationMutation < BaseMutation
      field :verifications, [Types::Entity::VerificationType], null: false

      argument :verifications, [Types::Input::VerificationInputType], required: true

      def resolve(verifications:)
        new_verifications = ::Verification.create!(verifications.map(&:to_h))

        new_verifications.group_by(&:participant_id).each_value do |v|
          VerificationMailer.with(verifications: v).invite.deliver_now
        end

        {
          verifications: new_verifications
        }
      end
    end
  end
end
