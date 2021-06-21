# frozen_string_literal: true

module Types
  module Entity
    class VerificationType < Types::BaseObject
      field :id, Integer, null: false
      field :dossier, DossierType, null: false
      field :participant, ParticipantType, null: false
      field :change_grading, Boolean, null: true
      field :comment, String, null: true
      field :verified_at, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
