# frozen_string_literal: true

module Types
  class AffiliationType < Types::BaseObject
    field :role, String, null: false
    field :tenant_name, String, null: false
    field :tenant_id, ID, null: false
  end
end
