# frozen_string_literal: true

class Dossier < ApplicationRecord
  belongs_to :affiliation, class_name: 'Affiliation'
  belongs_to :candidate, class_name: 'Person'
  belongs_to :primary_expert, class_name: 'Person'
  belongs_to :secondary_expert, class_name: 'Person'
  belongs_to :company_contact, class_name: 'Person'
  belongs_to :conference

  has_many :verifications

  has_one_attached :dossier_file

  accepts_nested_attributes_for :affiliation, :candidate, :primary_expert, :secondary_expert, :company_contact

  def dossier_download_path
    if dossier_file.attached?
      Rails.application.routes.url_helpers.rails_blob_url(dossier_file,
                                                          disposition: 'attachment')
    end
  end

  def tags
    tagList = []

    tagList << (verifications.where.not(verified_at: nil).exists? ? 'verified' : 'not-verified')
    tagList << 'no-invitation' unless verifications.exists?
    tagList << 'verified-with-change' if verifications.where(change_grading: true).where.not(verified_at: nil).exists?
    if submitted_mark.blank?
      tagList << 'no-final-mark'
    else
      tagList << 'insufficient' if submitted_mark.to_f < 4
      tagList << 'just-enough' if submitted_mark.to_f >= 4 && submitted_mark.to_f <= 4.3
      tagList << 'very-good' if submitted_mark.to_f > 5.5
    end

    tagList
  end
end
