# frozen_string_literal: true

module Types
  module Pkorg
    class EvaluationType < Types::BaseObject
      field :result, GraphQL::Types::JSON, null: false
    end
  end
end
