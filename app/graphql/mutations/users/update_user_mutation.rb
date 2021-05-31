# frozen_string_literal: true

module Mutations
  module Users
    class UpdateUserMutation < BaseMutation
      field :user, Types::UserType, null: false

      argument :id, Integer, required: true
      argument :user, Types::Users::UserInputType, required: true

      def resolve(id:, user:)
        updated_user = User.find(id)
        updated_user.update!(user.to_h)

        {
          user: updated_user
        }
      end
    end
  end
end
