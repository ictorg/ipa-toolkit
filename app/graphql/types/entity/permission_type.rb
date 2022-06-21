# frozen_string_literal: true

module Types
  module Entity
    class PermissionType < Types::BaseObject
      field :id, Integer, null: false
      field :dossier, DossierType, null: false
      field :user, UserType, null: false
    end
  end
end
