# frozen_string_literal: true

module Resolvers
  class VerificationResolver < BaseResolver
    type [Types::Entity::VerificationType], null: true

    argument :id, Integer, required: false
    argument :dossier_id, Integer, required: false

    def resolve(id: nil, dossier_id: nil)
      return [Verification.find(id)] if id
      return Verification.where(dossier_id: dossier_id) if dossier_id

      Verification.all
    end
  end
end
