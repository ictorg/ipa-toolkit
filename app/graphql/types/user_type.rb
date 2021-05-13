module Types
  class UserType < Types::BaseObject
    field :email, String, null: false
    field :name, String, null: true
    field :nickname, String, null: true
  end
end