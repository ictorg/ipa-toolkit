# frozen_string_literal: true

module Resolvers
  class ParticipantResolver < BaseResolver
    type [Types::Entity::ParticipantType], null: true

    argument :id, Integer, required: false
    argument :conference_id, Integer, required: false

    def resolve(id: nil, conference_id: nil)
      return [Participant.find(id)] if id
      return Participant.where(conference_id: conference_id) if conference_id

      Participant.all
    end
  end
end
