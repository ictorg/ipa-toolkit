# frozen_string_literal: true

module Resolvers
  class DossiersResolver < BaseResolver
    type Types::Entity::DossierType.collection_type, null: true

    argument :id, Integer, required: false
    argument :ids, [Integer], required: false
    argument :page, Integer, required: false
    argument :filter, Types::Input::DossierFilterInputType, required: false

    def resolve(id: nil, ids: nil, page: nil, filter: nil)
      return [Dossier.find(id)] if id
      return Dossier.find(ids) if ids

      dossiers = Dossier.eager_load(:affiliation, :candidate, :conference)

      dossiers = dossiers.page(page) if page

      if (filter)
        dossiers = dossiers.by_tenant_name(filter.tenant_name) if filter.tenant_name.present?
        dossiers = dossiers.by_mark_deduction(filter.mark_deduction) unless filter.mark_deduction.nil?
        dossiers = dossiers.by_tags(filter.tags) if filter.tags.present?
      end

      dossiers
    end
  end
end
