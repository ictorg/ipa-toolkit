module Resolvers
  class Pkorg::SessionUserResolver < BaseResolver
    type Types::Pkorg::SessionUserType, null: true

    def resolve
      {
        email: 'hoho'
      }
    end
  end
end