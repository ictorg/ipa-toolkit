module Resolvers
  class PkOrgResolver < Resolvers::BaseResolver
    field :current_user, Types::PkOrg::UserType, null: false

    def current_user
      {
        email: 'example@example.com'
      }
    end
  end
end