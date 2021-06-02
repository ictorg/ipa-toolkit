# frozen_string_literal: true

module Types
  module Input
    class AffiliationInputType < Types::BaseInputObject
      argument :id, Int, required: true
      argument :tenant_name, String, required: true
    end
  end
end
