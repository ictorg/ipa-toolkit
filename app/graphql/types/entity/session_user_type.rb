# frozen_string_literal: true

module Types
  module Entity
    class SessionUserType < Types::BaseObject
      field :email, String, null: false
      field :forename, String, null: false
      field :surname, String, null: false
      field :affiliations, [AffiliationType], null: false
    end
  end
end
