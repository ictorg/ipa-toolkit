require 'faraday'

class Pkorg::ImportService < ApplicationService
  DOSSIER_MAPPINGS = {
    affiliation: :affiliation_attributes,
    candidate: :candidate_attributes,
    primary_expert: :primary_expert_attributes,
    secondary_expert: :secondary_expert_attributes,
    company_contact: :company_contact_attributes
  }.freeze

  def initialize(session_token, user_agent, dossiers)
    super()
    @session_token = session_token
    @user_agent = user_agent
    @dossiers = dossiers
  end

  def import
    @dossiers.each do |d|
      dossier_path = d[:dossier_path]
      parsed_dossier = d.to_h.except(:dossier_path).transform_keys { |key| DOSSIER_MAPPINGS[key] || key }
      dossier = Dossier.find_or_initialize_by(candidate_id: parsed_dossier[:candidate_attributes][:id])
      dossier.affiliation = Affiliation.find_or_create_by(d[:affiliation].to_h)
      dossier.candidate = Person.find_or_create_by(d[:candidate].to_h)
      dossier.primary_expert = Person.find_or_create_by(d[:primary_expert].to_h)
      dossier.secondary_expert = Person.find_or_create_by(d[:secondary_expert].to_h)
      dossier.company_contact = Person.find_or_create_by(d[:company_contact].to_h)
      dossier.assign_attributes(parsed_dossier)
      dossier.save!

      AttachDossierJob.perform_later(dossier.id, dossier_path, @session_token, @user_agent)
    end

    {
      'import_count': @dossiers.length
    }
  end
end
