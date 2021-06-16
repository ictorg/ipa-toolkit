# frozen_string_literal: true

module Resolvers
  class ConferencesResolver < BaseResolver
    type [Types::Entity::ConferenceType], null: true

    argument :id, Integer, required: false

    def resolve(id: nil)
      return [Conference.eager_load(:participants).find(id)] if id

      Conference.all
    end
  end
end
