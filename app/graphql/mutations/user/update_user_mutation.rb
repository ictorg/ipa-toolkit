# frozen_string_literal: true

module Mutations
  module User
    class UpdateUserMutation < BaseMutation
      field :user, Types::Entity::UserType, null: false

      argument :id, Integer, required: true
      argument :user, Types::Input::UserInputType, required: true

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
