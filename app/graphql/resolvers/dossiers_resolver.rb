# frozen_string_literal: true

module Resolvers
  class DossiersResolver < BaseResolver
    type Types::Entity::DossierType.collection_type, null: true

    argument :id, Integer, required: false
    argument :ids, [Integer], required: false
    argument :page, Integer, required: false

    def resolve(id: nil, ids: nil, page: nil)
      return [Dossier.find(id)] if id
      return Dossier.find(ids) if ids

      Dossier.eager_load(:affiliation, :candidate, :conference).page(page)
    end
  end
end
