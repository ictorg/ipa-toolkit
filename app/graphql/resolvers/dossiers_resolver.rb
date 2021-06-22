# frozen_string_literal: true

module Resolvers
  class DossiersResolver < BaseResolver
    type [Types::Entity::DossierType], null: true

    argument :id, Integer, required: false
    argument :ids, [Integer], required: false

    def resolve(id: nil, ids: nil)
      return [Dossier.find(id)] if id
      return Dossier.find(ids) if ids

      Dossier.all
    end
  end
end
