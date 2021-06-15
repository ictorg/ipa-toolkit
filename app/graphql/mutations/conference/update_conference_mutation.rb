# frozen_string_literal: true

module Mutations
  module Conference
    class UpdateConferenceMutation < BaseMutation
      field :conference, Types::Entity::ConferenceType, null: false

      argument :id, Integer, required: true
      argument :conference, Types::Input::ConferenceInputType, required: true

      def resolve(id:, conference:)
        updated_conference = ::Conference.find(id)
        updated_conference.update!(conference.to_h)

        {
          conference: updated_conference
        }
      end
    end
  end
end
