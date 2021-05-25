# frozen_string_literal: true

module Mutations
  module Users
    class CreateUserMutation < BaseMutation
      field :user, Types::UserType, null: false

      argument :user, [Types::Users::UserInputType], required: true

      def resolve(user:)
        User.create!(user)
      end
    end
  end
end
