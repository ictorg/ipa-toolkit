# frozen_string_literal: true

module Types
  module Input
    class DossierInputType < Types::BaseInputObject
      argument :id, Int, required: false
      argument :affiliation, AffiliationInputType, required: true
      argument :candidate, PersonInputType, required: true
      argument :primary_expert, PersonInputType, required: false
      argument :secondary_expert, PersonInputType, required: false
      argument :company_contact, PersonInputType, required: false
      argument :conference_id, Int, required: true
      argument :company_points_a, String, required: false
      argument :company_points_b, String, required: false
      argument :company_mark_a, String, required: false
      argument :company_mark_b, String, required: false
      argument :expert_points_a, String, required: false
      argument :expert_points_b, String, required: false
      argument :expert_points_c, String, required: false
      argument :expert_mark_a, String, required: false
      argument :expert_mark_b, String, required: false
      argument :expert_mark_c, String, required: false
      argument :mark_deduction, Boolean, required: false
      argument :final_mark, String, required: false
      argument :submitted_mark, String, required: false
      argument :dossier_path, String, required: false
    end
  end
end
