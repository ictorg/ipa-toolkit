module Types
  module PkOrg
    class UserType < Types::BaseObject
      field :email, String, null: false
    end
  end
end