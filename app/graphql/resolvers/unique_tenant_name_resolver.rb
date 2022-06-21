# frozen_string_literal: true

module Resolvers
  class UniqueTenantNameResolver < BaseResolver
    type [String], null: true

    def resolve(id: nil, ids: nil, page: nil)
      Affiliation.pluck(:tenant_name).uniq
    end
  end
end
