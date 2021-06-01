# frozen_string_literal: true

module Mutations
  module Users
    class DeleteUserMutation < BaseMutation
      field :user, Types::UserType, null: false

      argument :id, Integer, required: true

      def resolve(id:)
        user = User.find(id)
        user.destroy

        {
          user: user
        }
      end
    end
  end
end