# frozen_string_literal: true

module Mutations
  module Users
    class CreateUserMutation < BaseMutation
      field :user, Types::UserType, null: false

      argument :user, Types::Users::UserInputType, required: true

      def resolve(user:)
        created_user = User.create!(user.to_h)

        {
          user: created_user
        }
      end
    end
  end
end