# frozen_string_literal: true

module Types
  module Input
    class DossierFilterInputType < Types::BaseInputObject
      argument :tenant_name, [String], required: false
      argument :mark_deduction, Boolean, required: false
      argument :tags, String, required: false
    end
  end
end
