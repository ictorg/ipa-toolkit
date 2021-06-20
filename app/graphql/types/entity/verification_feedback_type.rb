# frozen_string_literal: true

module Types
  module Entity
    class VerificationFeedbackType < Types::BaseObject
      field :id, Integer, null: false
      field :dossier, DossierType, null: false
      field :change_grading, Boolean, null: true
      field :comment, String, null: true
    end
  end
end
