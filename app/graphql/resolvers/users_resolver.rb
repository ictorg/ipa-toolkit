# frozen_string_literal: true

module Resolvers
  class UsersResolver < BaseResolver
    type [Types::Entity::UserType], null: true

    argument :id, Integer, required: false

    def resolve(id: nil)
      return [User.find(id)] if id

      User.all
    end
  end
end
