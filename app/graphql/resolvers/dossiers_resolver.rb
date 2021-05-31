# frozen_string_literal: true

module Resolvers
  class DossiersResolver < BaseResolver
    type [Types::DossierType], null: true

    argument :id, Integer, required: false

    def resolve(id: nil)
      return [Dossier.find(id)] if id

      Dossier.all
    end
  end
end
