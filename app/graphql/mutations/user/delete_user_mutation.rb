# frozen_string_literal: true

module Mutations
  module User
    class DeleteUserMutation < BaseMutation
      field :user, Types::Entity::UserType, null: false

      argument :id, Integer, required: true

      def resolve(id:)
        user = ::User.find(id)

        # Prevent suicide
        raise GraphQL::ExecutionError, 'Can\'t commit suicide.' if user.email == context[:current_resource].email

        user.destroy

        {
          user: user
        }
      end
    end
  end
end
