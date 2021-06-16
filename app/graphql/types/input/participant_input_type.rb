# frozen_string_literal: true

module Types
  module Input
    class ParticipantInputType < Types::BaseInputObject
      argument :id, Int, required: false
      argument :forename, String, required: true
      argument :surname, String, required: true
      argument :email, String, required: true
    end
  end
end
