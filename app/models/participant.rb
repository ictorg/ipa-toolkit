# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :conference
end
