module Types
  class PkorgMutationType < Types::BaseObject
    field :importDossiers, mutation: Mutations::Pkorg::ImportMutation
  end
end