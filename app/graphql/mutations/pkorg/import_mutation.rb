module Mutations
  class Pkorg::ImportMutation < BaseMutation
    field :import_count, Int, null: false

    argument :dossiers, [Types::Pkorg::DossierInputType], required: true

    def resolve(dossiers:)
      ::Pkorg::ImportService.new(
        object[:session_token],
        object[:base_url],
        object[:user_agent],
        dossiers
      ).import
    end
  end
end
