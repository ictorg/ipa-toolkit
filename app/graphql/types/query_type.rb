# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :verification_results, resolver: Resolvers::VerificationResultsResolver, authenticate: false
    field :pkorg, resolver: Resolvers::PkorgResolver
    field :users, resolver: Resolvers::UsersResolver
    field :dossiers, resolver: Resolvers::DossiersResolver
    field :conferences, resolver: Resolvers::ConferencesResolver
  end
end
