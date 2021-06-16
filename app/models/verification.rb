# frozen_string_literal: true

class Verification < ApplicationRecord
  belongs_to :dossier, class_name: 'Dossier'
  belongs_to :participant
end
