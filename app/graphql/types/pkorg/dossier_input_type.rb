module Types
  class Pkorg::DossierInputType < Types::BaseInputObject
    argument :affiliation, Pkorg::AffiliationInputType, required: true
    argument :candidate, Pkorg::PersonInputType, required: true
    argument :primary_expert, Pkorg::PersonInputType, required: false
    argument :secondary_expert, Pkorg::PersonInputType, required: false
    argument :company_contact, Pkorg::PersonInputType, required: false
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
  end
end
