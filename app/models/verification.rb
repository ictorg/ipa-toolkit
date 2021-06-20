# frozen_string_literal: true

class Verification < ApplicationRecord
  belongs_to :dossier
  belongs_to :participant
end
