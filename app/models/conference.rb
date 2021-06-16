# frozen_string_literal: true

class Conference < ApplicationRecord
  has_many :participants

  accepts_nested_attributes_for :participants
end
