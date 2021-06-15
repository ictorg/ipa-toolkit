# frozen_string_literal: true

module Mutations
  module Conference
    class CreateConferenceMutation < BaseMutation
      field :conference, Types::Entity::ConferenceType, null: false

      argument :conference, Types::Input::ConferenceInputType, required: true

      def resolve(conference:)
        new_conference = ::Conference.new(conference.to_h)
        new_conference.save!

        {
          conference: new_conference
        }
      end
    end
  end
end
