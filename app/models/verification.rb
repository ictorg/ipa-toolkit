# frozen_string_literal: true

class Verification < ApplicationRecord
  belongs_to :dossier
  belongs_to :participant, counter_cache: :verifications_count

  before_create :set_token

  private

  def set_token
    self.token = SecureRandom.hex(32)
  end
end
