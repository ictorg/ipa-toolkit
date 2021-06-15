# frozen_string_literal: true

module Types
  module Entity
    class ConferenceType < Types::BaseObject
      field :id, Integer, null: false
      field :name, String, null: false
    end
  end
end
