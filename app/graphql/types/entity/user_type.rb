# frozen_string_literal: true

module Types
  module Entity
    class UserType < Types::BaseObject
      field :id, Integer, null: false
      field :email, String, null: false
      field :name, String, null: true
      field :nickname, String, null: true
      field :superuser, Boolean, null: true
      field :permissions, [PermissionType], null: true
    end
  end
end
