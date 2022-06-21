# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :conference
  has_many :verifications
end
