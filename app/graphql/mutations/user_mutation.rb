# frozen_string_literal: true

module Mutations
  class UserMutationType < Types::BaseObject
    field :createUser, mutation: Users::CreateUserMutation
  end

  class UserMutation < BaseMutation
    type UserMutationType

    def resolve; end
  end
end
