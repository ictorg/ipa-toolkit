# frozen_string_literal: true

module Mutations
  module Conference
    class CreateConferenceMutation < BaseMutation
      field :conference, Types::Entity::ConferenceType, null: false

      argument :conference, Types::Input::ConferenceInputType, required: true

      def resolve(conference:)
        created_conference = ConferenceService.new(
          conference
        ).save

        {
          conference: created_conference
        }
      end
    end
  end
end
