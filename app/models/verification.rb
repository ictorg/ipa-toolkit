# frozen_string_literal: true

class Verification < ApplicationRecord
  belongs_to :dossier, class_name: 'Dossier'
end
