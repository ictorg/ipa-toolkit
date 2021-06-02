# frozen_string_literal: true

module Mutations
  class UserMutationType < Types::BaseObject
    field :createUser, mutation: User::CreateUserMutation
    field :updateUser, mutation: User::UpdateUserMutation
    field :deleteUser, mutation: User::DeleteUserMutation
  end

  class UserMutation < BaseMutation
    type UserMutationType

    def resolve
      {}
    end
  end
end
