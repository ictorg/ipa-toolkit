# frozen_string_literal: true

module Mutations
  class UserMutationType < Types::BaseObject
    field :createUser, mutation: Users::CreateUserMutation
    field :updateUser, mutation: Users::UpdateUserMutation
    field :deleteUser, mutation: Users::DeleteUserMutation
  end

  class UserMutation < BaseMutation
    type UserMutationType

    def resolve
      {}
    end
  end
end
