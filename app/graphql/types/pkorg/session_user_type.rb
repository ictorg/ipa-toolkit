# frozen_string_literal: true

module Types
  module Pkorg
    class SessionUserType < Types::BaseObject
      field :email, String, null: false
      field :forename, String, null: false
      field :surname, String, null: false
      field :affiliations, [Types::AffiliationType], null: false
    end
  end
end
