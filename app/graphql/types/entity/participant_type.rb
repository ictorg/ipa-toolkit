# frozen_string_literal: true

module Types
  module Entity
    class ParticipantType < Types::BaseObject
      field :id, Integer, null: false
      field :forename, String, null: false
      field :surname, String, null: false
      field :email, String, null: false
      field :verifications_count, Integer, null: true
    end
  end
end
