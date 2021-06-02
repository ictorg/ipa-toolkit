# frozen_string_literal: true

module Types
  module Entity
    class VerificationType < Types::BaseObject
      field :id, Integer, null: false
      field :email, String, null: false
    end
  end
end
