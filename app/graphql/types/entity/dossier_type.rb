# frozen_string_literal: true

module Types
  module Entity
    class DossierType < Types::BaseObject
      field :id, Integer, null: false
      field :affiliation, AffiliationType, null: false
      field :candidate, PersonType, null: false
      field :primary_expert, PersonType, null: true
      field :secondary_expert, PersonType, null: true
      field :company_contact, PersonType, null: true
      field :conference, ConferenceType, null: false
      field :company_points_a, String, null: true
      field :company_points_b, String, null: true
      field :company_mark_a, String, null: true
      field :company_mark_b, String, null: true
      field :expert_points_a, String, null: true
      field :expert_points_b, String, null: true
      field :expert_points_c, String, null: true
      field :expert_mark_a, String, null: true
      field :expert_mark_b, String, null: true
      field :expert_mark_c, String, null: true
      field :mark_deduction, Boolean, null: true
      field :final_mark, String, null: true
      field :submitted_mark, String, null: true
      field :dossier_path, String, null: true
      field :dossier_download_path, String, null: true
      field :verifications, [VerificationType], null: true
    end
  end
end
