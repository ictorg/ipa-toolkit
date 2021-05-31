# frozen_string_literal: true

module Types
  class PersonType < Types::BaseObject
    field :id, Integer, null: false
    field :forename, String, null: false
    field :surname, String, null: false
  end
end
