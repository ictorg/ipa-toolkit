# frozen_string_literal: true

module Mutations
  module User
    class CreateUserMutation < BaseMutation
      field :user, Types::Entity::UserType, null: false

      argument :user, Types::Input::UserInputType, required: true

      def resolve(user:)
        created_user = User.create!(user.to_h)

        {
          user: created_user
        }
      end
    end
  end
end
