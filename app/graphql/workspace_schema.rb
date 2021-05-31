# frozen_string_literal: true

class WorkspaceSchema < GraphQL::Schema
  use GraphqlDevise::SchemaPlugin.new(
    query: Types::QueryType,
    mutation: Types::MutationType,
    resource_loaders: [
      GraphqlDevise::ResourceLoader.new(User, only: %i[login logout])
    ]
  )

  mutation(Types::MutationType)
  query(Types::QueryType)

  # Union and Interface Resolution
  def self.resolve_type(_abstract_type, _obj, _ctx)
    type_class = "::Types::#{object.class}Type".safe_constantize

    raise ArgumentError, "Cannot resolve type for class #{object.class.name}" unless type_class.present?

    type_class
  end

  # Relay-style Object Identification:

  # Return a string UUID for `object`
  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  # Given a string UUID, find the object
  def self.object_from_id(id, _query_ctx)
    return unless id.present?

    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    type = type_name.safe_constantize
    type&.find_by id: item_id
  end

  rescue_from(ActiveRecord::RecordNotFound) do |_err, _obj, _args, _ctx, field|
    raise GraphQL::ExecutionError, "#{field.type.unwrap.graphql_name} not found"
  end

  rescue_from(ActiveRecord::RecordInvalid) do |err, _obj, _args, _ctx, field|
    raise GraphQL::ExecutionError, "#{field.type.unwrap.graphql_name} is invalid: #{err.message}"
  end
end
