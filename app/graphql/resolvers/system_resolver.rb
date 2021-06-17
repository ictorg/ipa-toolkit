module Resolvers
  class SystemType < Types::BaseObject
    field :version, String, null: false
  end

  class SystemResolver < BaseResolver
    type SystemType, null: true

    def resolve
      {
        version: Rails.application.config.version
      }
    end
  end
end
