# frozen_string_literal: true

module Resolvers
  class UsersResolver < BaseResolver
    type [Types::UserType], null: true

    def resolve
      User.all
    end
  end
end
