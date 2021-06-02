# frozen_string_literal: true

module Types
  module Entity
    class EvaluationType < Types::BaseObject
      field :result, GraphQL::Types::JSON, null: false
    end
  end
end
