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

  scope :by_tenant_name, ->(tenant_name) { where(affiliations: { tenant_name: tenant_name }) }
  scope :by_mark_deduction, ->(mark_deduction) { where(mark_deduction: mark_deduction) }
  scope :by_tags, ->(tags) do 
    case tags
    when 'verified'
      next joins(:verifications).where.not(verifications: { verified_at: nil })
    when 'not-verified'
      next where(verifications: { verified_at: nil }).left_outer_joins(:verifications)
    when 'no-invitation'
      next where(verifications: { id: nil }).left_outer_joins(:verifications)
    when 'verified-with-change'
      next joins(:verifications).where(verifications: { change_grading: true }).where.not(verifications: { verified_at: nil })
    when 'no-final-mark'
      next where(submitted_mark: nil)
    when 'insufficient'
      next where(Dossier.arel_table[:submitted_mark].lt(4))
    when 'just-enough'
      next where(Dossier.arel_table[:submitted_mark].gteq(4)).where(Dossier.arel_table[:submitted_mark].lteq(4.3))
    when 'very-good'
      next where(Dossier.arel_table[:submitted_mark].gt(5.5))
    end
    
    none
  end

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
