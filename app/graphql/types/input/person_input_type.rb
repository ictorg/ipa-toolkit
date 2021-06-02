# frozen_string_literal: true

module Types
  module Input
    class PersonInputType < Types::BaseInputObject
      argument :id, Int, required: true
      argument :forename, String, required: true
      argument :surname, String, required: true
    end
  end
end
