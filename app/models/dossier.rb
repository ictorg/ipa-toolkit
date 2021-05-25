# frozen_string_literal: true

class Dossier < ApplicationRecord
  belongs_to :affiliation, class_name: 'Affiliation'
  belongs_to :candidate, class_name: 'Person'
  belongs_to :primary_expert, class_name: 'Person'
  belongs_to :secondary_expert, class_name: 'Person'
  belongs_to :company_contact, class_name: 'Person'

  has_one_attached :dossier_file

  accepts_nested_attributes_for :affiliation, :candidate, :primary_expert, :secondary_expert, :company_contact
end
