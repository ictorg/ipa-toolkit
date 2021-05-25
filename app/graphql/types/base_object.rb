# frozen_string_literal: true

module Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField

    def self.default_graphql_name
      @default_graphql_name ||= begin
        if name.nil?
          raise GraphQL::RequiredImplementationMissingError,
                'Anonymous class should declare a `graphql_name`'
        end

        name.split('::')[1..].join.sub(/Type\Z/, '')
      end
    end
  end
end
