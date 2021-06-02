# frozen_string_literal: true

module Mutations
  module Pkorg
    class ImportMutation < BaseMutation
      field :import_count, Int, null: false

      argument :dossiers, [Types::Input::DossierInputType], required: true

      def resolve(dossiers:)
        ::Pkorg::ImportService.new(
          object[:session_token],
          object[:user_agent],
          dossiers
        ).import
      end
    end
  end
end
