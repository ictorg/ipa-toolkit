module Types
  class Pkorg::SessionUserType < Types::BaseObject
    field :email, String, null: false
    field :forename, String, null: false
    field :surname, String, null: false
  end
end
