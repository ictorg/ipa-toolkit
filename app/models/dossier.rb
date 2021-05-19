class Dossier < ApplicationRecord
  belongs_to :affiliation, class_name: Affiliation
  belongs_to :candidate, class_name: Person
  belongs_to :primary_expert, class_name: Person
  belongs_to :secondary_expert, class_name: Person
  belongs_to :company_contact, class_name: Person
end
