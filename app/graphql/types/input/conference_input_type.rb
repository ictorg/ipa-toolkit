# frozen_string_literal: true

module Types
  module Input
    class ConferenceInputType < Types::BaseInputObject
      argument :id, Int, required: false
      argument :name, String, required: true
      argument :password, String, required: true
      argument :participants, [ParticipantInputType], required: true
    end
  end
end
