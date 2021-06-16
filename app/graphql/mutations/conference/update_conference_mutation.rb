# frozen_string_literal: true

module Mutations
  module Conference
    class UpdateConferenceMutation < BaseMutation
      field :conference, Types::Entity::ConferenceType, null: false

      argument :conference, Types::Input::ConferenceInputType, required: true

      def resolve(conference:)
        updated_conference = ConferenceService.new(
          conference
        ).save

        {
          conference: updated_conference
        }
      end
    end
  end
end
