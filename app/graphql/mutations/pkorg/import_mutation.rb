module Mutations
  class Pkorg::ImportMutation < BaseMutation
    field :import_count, Int, null: false

    argument :dossiers, [Types::Pkorg::DossierInputType], required: true

    def resolve(dossiers:)
      {
        'import_count': 0
      }
    end
  end
end
